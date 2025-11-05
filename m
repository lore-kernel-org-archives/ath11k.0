Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D2BCCF9F8
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIpJpCtpdy9AxFK+L7eD7KjKFSrIIyf34Fuzo5T+UM8=; b=v/ynar7nB84aZjMwwTbiBNs0su
	Tn9cSPLYBIEkjhT6UsHyuZt6QEi7Y0ihy7tRd0csdbFVG57ceVK/dXBDqaKN5AZtVjpaaZDO7BN4y
	etmS0WaFWHKbFNUYQK7kqOxaXJKM4Rn3x/B8AKDA+Rfy6l7Um0aoD7hRXjFLh8P3MRYAXPjQS2w2A
	JehSZkB48on/kSQsysGiiqLhLyQoSo17hh7ReZsMvGhqs1mHT6hu2IbQ5vLQrkFWXsEvisGpZEH3B
	5oq7BTzzQTc0ecbevtwJO+dt/VkdB+PyMhG5Fva6rKVsUE6yohuPu5r7yzha+DoKzz50YSgaV/6wB
	1ntdTalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfpY-0000000Dzne-3YLm;
	Wed, 05 Nov 2025 15:53:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfpU-0000000Dzmt-3NOW
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 15:53:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5DaqvE3913777
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 15:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIpJpCtpdy9AxFK+L7eD7KjKFSrIIyf34Fuzo5T+UM8=; b=lv+gGyPADvz8Wa0H
	BKRSb20ZEDhz+3Wf+jM306pg445FwfeyPDofwL0CiLKvWOMMKBR7iFwVR0hcJZp0
	fBAqnM4qNAFfdKy2TlCVCdrmwBtv5QG94Br5fAwbgKN18b04EiBcGv/GJki6IEKB
	IIa/O60deNy9AVEhkZn8bhoUqsQ0xtvB7j1MW4q4LWmWajK0oni0RMJ39cSkM/Ds
	qizfvXKqGsIfND1XD8ZbwBjPHJR9hk4UEH1ayFEpFveaAhXEAk6Ull6RuO3cVs89
	oifC7VVAOxL/79lmQtHSYnJEJd0xs1Ztew2PDYNJ3D5ymzwouELTAj2qFlHF4vg1
	6HceaQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y379t2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 15:53:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso6470801a12.1
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762358026; x=1762962826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIpJpCtpdy9AxFK+L7eD7KjKFSrIIyf34Fuzo5T+UM8=;
        b=dMQNJ201GwizwUlzFSYNQQTw7X8zlLuoB13enY4JQC0KRzSExK3wpLbg0x74/OvXsk
         6c9uorN4aQCqMnDCxkwVkPcpLunCkByeFwA6A0/oQEPp9/35VqlY5LUMT1EQwLrtVNEt
         56UiJfxUdMVUzrRrvXd/HMCYr57PR6Txj9gQvJekrh3qo7Ndlz3X5Auuu0g46sPtkL6L
         yLxntA6yUmrzLwFrKduUP91DvJQERMksbr3fz5VYyVoQI+A1XiKV2ejvmL6rIzKsCvA9
         llHp7E298eGEJ/litVvBd1pBFEmp3oeGrCb6oWfSuH1CiJ6t6ULTUAVn669xuSTkoyrY
         TB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358026; x=1762962826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIpJpCtpdy9AxFK+L7eD7KjKFSrIIyf34Fuzo5T+UM8=;
        b=A0OFBZWkZW99JOgYNXCklS9iUSM4Mgsa0M/LCRRnVaB1JOMZAXVJNrWwXP5zwUFZ7N
         XcRbq2Hf5ZjjhGQZQLPOerVy0A/IFpgYan/sFDRJsx62bKbpiH/ID9R/DgAW8LiAlKpF
         USRmsGPtdw0EXaFWVYImCYeBlegmIDzNcHYSZTuVyTqJHGM8hUfJZQrgq02Gisc1HTL2
         9VGKPMguWyWdR3q/cpITzqc6WMJPp+eBzjlWBXztrbX+jClug5ElkBvEGzt5kbm6twfZ
         pSzfvZnKUDWJ67qEmEcYWdGseGIb8BJ4uBoiihN63bcwJFqR+ZHvb0b+GwCnlDKSOx55
         pSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcrz1mmI0gRQEcFwiFixw7xjY0gj5s1zLgBtIMVMombYRU6qr9ufPX66iwPKWs+VoRyckaiXk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YW2uoS7yDOJ/qrCUOmzY6yJ9H0va0KnwFe+WvJauALOiEWn2
	WwY9HEcdz9OZuA/x/pyHdYYE9kTX14wWdgwBcqfczsAAaL/epz5q549nyIUaYCLBPi73xRqckY3
	yu1ALgmaRj6MOyUKoKaVNdfZXJIP5pnZl3veQSB+8R/9Xh3ugCAJkyb8rNJoWjjs02joo+FWK
X-Gm-Gg: ASbGncuzbej5dsIaemeIO57lGc8Hht3IhFnyXGgXKbmiohB/157mfvfGI765MYX4E5k
	f6hoWAeCMAbuL6RjH7K1HWXPr1fpwuvuU0YlBfRC3HvbYNlZgMA2Xb4OrkB3J1BZGqTmW5fjBi7
	fcq8fsiZugJ1/G8k+nhWb5rMyPpT65OvRfk81oKT7xLyc5alL8SwGVakgcvMTucHwGTE+SwUguo
	g9IeftVLR9P5NpY1K/hsghmI7Ln+s5fbPBRlx3DpCg88og50nsYoHUV41iVWmDecni7K8VUVaox
	TYt+j1sSG5QXHjgyr4G/dVjPpeUqP2OZ7zymtUgLkvSF7xNJSRcT+bGSEWbsrb6KSIZxyTy6jRI
	I7xvzE8yVRKBLe14VfOpxCRTT2jQJob5Eh36tKjiXQhNLOkmfWg==
X-Received: by 2002:a05:6a21:6d93:b0:341:fd8d:f7ff with SMTP id adf61e73a8af0-34f839e0a80mr4883618637.3.1762358026114;
        Wed, 05 Nov 2025 07:53:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWPTswD6bwS0ACbO78o+tMMejsGRrbYXAludinRJViWKSX0msrPt64dxhMaeeZ02LRMI4OQA==
X-Received: by 2002:a05:6a21:6d93:b0:341:fd8d:f7ff with SMTP id adf61e73a8af0-34f839e0a80mr4883551637.3.1762358025284;
        Wed, 05 Nov 2025 07:53:45 -0800 (PST)
Received: from [192.168.225.142] ([157.49.197.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6a15af3sm6746391b3a.69.2025.11.05.07.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:53:45 -0800 (PST)
Message-ID: <3393053a-7f6f-c7f8-51c2-60b9a4577808@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 21:23:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath11k: zero init info->status in
 wmi_process_mgmt_tx_comp()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251104083957.717825-1-nico.escande@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251104083957.717825-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ky3jpCeuRhnOKaJp0ZgbF2VXMu5Ik1xK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyMSBTYWx0ZWRfX6b5gpeJRSb3i
 svtcTUWY6SjLxiFsu0prdzVx9hVYPPLM0eWmpzUgnV1lJ7hGFkuNujhrSXDrqGCA97YZ3BXoVfa
 z2CzTaGUKOSZfMzLS/tPbC6o+fiYCMvCihBKJsACAdWWljZIS29o6tmI+sl4LoinKhHNKR6f02D
 ujR6Qg6eVQl6xdXYVOeHjGkbgkYRcYGcP5bTzrkoo0dh86cvsMf2/cvkwsomjlTkTqv9uQxPL4v
 OaGPOZws5q0XvBRAbi2rmuzjmCvb9CQQlBI3jfyxk+/SrJ7M+GZDa0tm128FrBKXpP38HSDNTpR
 2/vOocIlBMX+V4fonDRItJE9rUlGlT7tCvLkNIsg5F8uB/MJH0+Ne3JwnpQvBxCeAdN0EXToO80
 A4j0uMxJT+rcEIu7dD0mciB/mpA8EQ==
X-Proofpoint-ORIG-GUID: Ky3jpCeuRhnOKaJp0ZgbF2VXMu5Ik1xK
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b730b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=eKmoxwADn/1RPUtIdbDR2Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WOUW82yGRNmFkX8bwEgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075349_700510_C67FF470 
X-CRM114-Status: GOOD (  11.18  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 11/4/2025 2:09 PM, Nicolas Escande wrote:
> When reporting tx completion using ieee80211_tx_status_xxx() familly of

nit: s/familly/family

> functions, the status part of the struct ieee80211_tx_info nested in the
> skb is used to report things like transmit rates & retry count to mac80211
> 
> On the TX data path, this is correctly memset to 0 before calling
> ieee80211_tx_status_ext(), but on the tx mgmt path this was not done.
> 
> This leads to mac80211 treating garbage values as valid transmit counters
> (like tx retries for example) and accounting them as real statistics that
> makes their way to userland via station dump.
> 
> The same issue was resolved in ath12k by commit 9903c0986f78 ("wifi:
> ath12k: Add memset and update default rate value in wmi tx completion")
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

