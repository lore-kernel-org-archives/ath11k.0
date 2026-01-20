Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A3D2ECFD
	for <ath11k@archiver.kernel.org>; Tue, 20 Jan 2026 01:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lo5hkEABfahVXNweqbZswU7f6XJxKtIJQAc9Kau6Vco=; b=u8/VRM/bc5nxtOOPXYyNdLJqbd
	Ov6WJd+RgcjI4hVvKm0ixpDJkjL6bKJrNQ+ZJpxb0uMjOY6pd6PyhT83TNiVi9zgSiCK8Zxx28D4F
	0ZvxVL/kaGCG7vn99A6sDnPvts9dsPhO6oM2Zsc8Wr13OaqaJipH7uO2C4G9P7MzjjP1u3X8J23c9
	KpVSLb0mtUVJRv0/noFOcQUagHNf70/5uZBSGZ2Dp0lOTuMPmD3qESfRcFf2unYG6/r5siRp0CBWE
	7wNaiv8+c9h8CQHLFe/DUXVahFBNR42QTc1F9mEj+sGTIRe4QBpo15vD97SPm/c3Qao0Jg+nl727v
	bbRmlPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0ae-000000032LJ-11Vu;
	Tue, 20 Jan 2026 01:31:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0ab-000000032Kx-2KqQ
	for ath11k@lists.infradead.org;
	Tue, 20 Jan 2026 01:31:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMbDex1931209
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 01:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lo5hkEABfahVXNweqbZswU7f6XJxKtIJQAc9Kau6Vco=; b=fglNsu1xx7wBnxIn
	y0Fv+ZhZgmJ8iEygf6IQeDMsnCOGPkAUs0nDdUB0xn2IpPAJHjOvLgmH0EmO52a0
	WspeH9MxVHIwYl740X/caX4ZC8wHteL5z7chIqErgd3MQzGhZaAkguBggyfTWb/1
	hASotFtnW5pe/QoXriTExcxYBLOu1uG+fJwSxRXqt5h78fDbdm25NrXJIwdxvSBB
	+8ztFrjIJe3EdoEF5enrZE3qtVceplbXYGnTHFPih6Pc1UplVEmNLqgtCzYrmWRD
	cW1PM/NhFoQAvc5dV/H8rr+6+T6ARJZ0qJgdNGZBym3gO7R2NAv+2ZNVD6PKaM0D
	8WBuEw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfrakcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 01:31:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c549aaa796dso7614577a12.1
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 17:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768872683; x=1769477483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lo5hkEABfahVXNweqbZswU7f6XJxKtIJQAc9Kau6Vco=;
        b=R66NV624CYZfPFx6duESPxVSHxh7fcF2/iDM8HeWzlVb19gVkbhf+DZGFb6v7zGHLc
         QtR6nJkiSMqDu0Rt+ldaPSeKspztxVa54/8qCBEXWPACXTjDWU9/HQG1YRSYLWwyygRM
         X0OGpxRNpnNH0rDmBhY60qfZsVdUDb3mzE3jJC5/aDSOhn438LL7uyEleZpsAmygCnpp
         bo/RM+d3wp5k1EMrjmIcFw9p3NTztevjcvBnj2D3ct+w3Db3SXIAUi+z0EeePZb14EBk
         FLS1Z2VTQONxN5TLoQcTc6onCPjzAJzImDtOMVE406A+jPtMPtZJw63zvoGe5NatcDYk
         FyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872683; x=1769477483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lo5hkEABfahVXNweqbZswU7f6XJxKtIJQAc9Kau6Vco=;
        b=BZqHLtMFc9Hg3CfGJekygKLFxPtF76tqmfDI0PpOzArtdg/Y6hQYr6BSo86ZK3R5Gp
         grWx5m+RGdX/gSs0FERC0DFQy1/G7ydLl5Tnpng7GVIHRD3QVc/igFCPIXbF8enTxEQW
         xYVpMeTVKXWiafhisj0oNluN/1V7wzIECn0QtmxV2O3nzeajs6S1LDWvXLYbR9hhs3kR
         qnGRU6g0rJvIF76v1OtruFkVXVhYBfuEOeQh/nWrIdso766ynADF0e3kOZabupRDkXhp
         DBe3ODpw8h3+5vvLSO7W/14HGfdFfqDFqiSpufBFV9/W4OrKWzdo0f2/dD9vOJ8RYHpB
         s9oA==
X-Gm-Message-State: AOJu0YyEOFQYjsSM1kiisfrZiHMWVnZoTWQGcySi6IPqlhnv1vzfiRp6
	herBZ51xuB+bAPbwXZc3R2A7NxZOjUPcRJdHUA1bE07WKWgiQ3jMpTSRCrkh7g/p7LcA9MQESGs
	/9mcwBwFbB83jLfZloLPXfdbPnyLIeCxjBox0FkwRm/cwOErE3TDCPCCqiiwt0wpL
X-Gm-Gg: AZuq6aL7xyqH+9QeLSK6GpOFkmKJ9A0GGNJpkV70Fg13W79UEqVpIa7LNZvzGCBGcJO
	JUZerE1JnuEHe1yLZzDq+GaPa7pRfvi/T23nIJXMRlFSOBlztmWyp3k5MGDdPzKUaColZ2s0vZn
	/DavqkCDNAt/CKnwTKYbu/7MoPq0p9j4NTqfoGqZazF743/IqK97u2d7htvjNtylG+SFPWZ3wj1
	jg/e9me15c7fxV9kJFh8rK0xi/m0GtjAJ8nxApDSaJyWAUM8mwQ18zAYojg+rExS4wUxNJeUrX7
	DlAFGeQDoEu//hOT/JYVI3SRu9QuC0Y2V7vPS5zW6ni21LWd8GT4WRocn7YHmKw1rThv5qxOi4w
	6H0hNbm+BI8+QrvS6byPMAqud7wj1yT/5u57ldwO0wLxQ2AULwdH6NMbCNDBSJO6ksYhJ3jXKiC
	+ixEbg
X-Received: by 2002:a17:902:e842:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a7698f3e16mr2290065ad.23.1768872682851;
        Mon, 19 Jan 2026 17:31:22 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a7698f3e16mr2289815ad.23.1768872682297;
        Mon, 19 Jan 2026 17:31:22 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d16a8sm106620155ad.39.2026.01.19.17.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:31:21 -0800 (PST)
Message-ID: <61c8787d-ddfa-4cf8-b3fa-a85cc1526680@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 09:31:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-current 2/2] dt-bindings: net: wireless:
 ath11k-pci: deprecate 'firmware-name' property
To: Krzysztof Kozlowski <krzk@kernel.org>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
 <20260119140238.3360658-3-miaoqing.pan@oss.qualcomm.com>
 <2bf8dfc9-148a-4914-86a9-ebbb871a6887@kernel.org>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <2bf8dfc9-148a-4914-86a9-ebbb871a6887@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U1zB9gBBDvX_MepGCE9WLuxmUH-F5ssF
X-Proofpoint-GUID: U1zB9gBBDvX_MepGCE9WLuxmUH-F5ssF
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696edaeb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5fP8d3j7kvdYVt2Ov_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAxMSBTYWx0ZWRfXyHwdpSeH8FKX
 C5eCC84Z9ANPpD7x919iaPe/I628vZu72sw2q6sFDbJT1LWm1N/myIqJm2FCAvHXC5sFreesbZM
 gebSnrVZ/8hmREq22chqPQ0YeIIqdHwjLZkV0AMpSteIR6pbk/PpaoZchehENua4KlWxa0URn7v
 3cXR8PZPNPZNt+SKS+ERfe1G6ail+micUS8iJh5igGc/VzZ44Fmo/HBHdA1n8VgPJgKQXGvIuIw
 xlMCMvghvXOL84TB1BGRQHZiaDLmzi3PVWJEmnrxClgPlH4BVnjoeueCvpG6+SACx0QPIUZhRYN
 A0RlN26BPtnlMdWTDHgBWVCxIHeQ3hdrmCqyP/pubywK6zVikG7ArYbf3NkIuXjGonik2lkK9fm
 SDTMD4HVTlIxogTyot3J7kywKOesSjIBPxzBSWsxnLYnsjhLOYnKW+doUWtmZWGJI8sk6zwRg9p
 ivVtZai0D/xWc1zA8fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173125_724456_DB8F90B7 
X-CRM114-Status: GOOD (  11.87  )
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



On 1/19/2026 10:48 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 15:02, Miaoqing Pan wrote:
>> The firmware-name property was originally introduced to allow end-users
>> and integrators to select use-case-specific firmware for the WCN6855.
>> However, specifying firmware for an M.2 WLAN module in the Device Tree
>> is not appropriate. Instead, this functionality will be handled within
>> the ath11k driver. Therefore, the firmware-name property is now
>> deprecated.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> 
> 
> Is this the same patch as the one which received review/tag?
> 
> Best regards,
> Krzysztof

Do you mean adding back the tag
‘Acked-by: Rob Herring (Arm) <robh@kernel.org>’ because the patch had no 
changes when that review/tag was given?

