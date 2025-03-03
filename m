Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69672C282CD
	for <ath11k@archiver.kernel.org>; Mon,  3 Mar 2025 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjaEGavEZhaf/n/BWdL16Lx6yvyWPHtzKIlO2g0w1kc=; b=FTXz6ZVH7ajeGWk/K0uA0mve67
	GRYXpFBmjXb0YBXhl7e6B2urtnf5AmO6BlCDrzJj0SZ98mdwf8bmUcne8WoNEx4JxQQLN+4KouOvW
	vNaLj9nXW0h3+LR1qcxzF1YVwToXD3MnJ9Kw51F1DGndgi4490ra3TmkP4KxsjSqen+NYlCkUlSEO
	VKbKoCI8iS74a9N1eLDQd3+3xbhH6QPoAZJqxeuVC5Yb8Ue/XZyKeittXWMTsx8oMv67kN54vigOE
	POLPf3/WEZarUnR4fST+DZmBzM24HfxExF8u9lhVnsCLzAtJVGN55z6SfOUm+lD/GDK3HE0TlzLDm
	ZK3BThDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8R6-00000001StO-0EOV;
	Mon, 03 Mar 2025 16:14:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8Eh-00000001PtT-0wwi
	for ath11k@lists.infradead.org;
	Mon, 03 Mar 2025 16:01:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523ALRDE032039
	for <ath11k@lists.infradead.org>; Mon, 3 Mar 2025 16:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjaEGavEZhaf/n/BWdL16Lx6yvyWPHtzKIlO2g0w1kc=; b=FGwuvb7fPeCdUYmt
	kSEV+tNt2exVNAVOVU5hX26IERHMoo9UNVgLlvIpctgCziJsB3TAnNYrv80c6wY4
	qLkEGYNmMZ+3bbVGLkD/J5X2+gYwmQgbHjY+SXhE0UMgV6VDdQFWkKAQg3CoQuZP
	04Hvo2JICh4Y8BSk90bxpKmLNPuWcxbZQRnQiqMXnOg9KADvtuDne/5x9zmJfVxF
	JpHEAZInTpXaqZMeqDl0VioKXJijBoA5tbOyfe9tO5uXSqGViZZU/uCgVvV4Zlij
	rAx+wUzKOsj8bXHWXE4/zTqtM0XMxTw3v9iHqxtwk4vJuUuLOpPsUjr8N3epnCD1
	tc0V8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95weab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Mar 2025 16:01:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fe8c5dbdb0so9088725a91.3
        for <ath11k@lists.infradead.org>; Mon, 03 Mar 2025 08:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017699; x=1741622499;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjaEGavEZhaf/n/BWdL16Lx6yvyWPHtzKIlO2g0w1kc=;
        b=o6h9+hCvv0sykuqRGExXmCLQkqAzf5k4uuN6YwcE6Dp6nf0kg9opqMsiChU/wowLk3
         uU7oeTKiZnzcXxLZB71MjGks4zCrXebem+QMc8EJ+EfFacsHPUDQNxU2QNiMPwD7kQTT
         F2ITDvW486Ty2qoX3Y/ikWkEkP+p9bRodmC+qz86i0ryLqKWheY7i86E4QFtMjaS9WuL
         uGSWKX+KN6eo87PVlSUbIUoNMo2+CbOUv1g1gwEw6egwtjbd/Rht2cXTyFiNBFxdtxlu
         I7SO77uRwzQoCKgFX4KndhYEe8TNpwCGHmzgf/wdMfLrGcdtHk0GBpN6mlCSqWGdlJWn
         Rycg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZG210hYVWi7hEKawKyB7jfKVcL9ku/ePn7bK7LkE8cD665ta89X6EppjeAuXI0u8oC5q+Zw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAKDVVBD3xmHQWU+2VXXWCJtUoEDpqj51pfDK5+MHd5dxKSac2
	pgEstmw7BRXbdCy4Y7y6qlz4SJeNumQlIOb71ZG4czVXJ9Hk6cizy/qsaXJyowK8lPF8kZGIn9F
	0R56bVWnm1H4pPTghw3U3xMhcxkHGerFhe7CaYNzmehR6RYUNWgQ6pyVXqpF5lOXYFd1n
X-Gm-Gg: ASbGncuFjfivxZWVH3h1W/laUzgFhvXSiCNiHR6J4bKhEdWIrFw01ffKpPeRWiAXJ2f
	mBQ2O1awPw0IyRh/qqLiRy794Z/VOExuFfxG2lO2x+DusiMY3vDKtR42quYm4u/KrnjdleExD3h
	9dzt2nT3qLjOpf34nHKvO8tHur9HuNxsTlbsamakINzUggqPfcpgoIZhdYWrJcZNWBXERi/Wc+/
	OaTY6WfzZ3PG6gVlSG1JpIlSMLhDg12tAm1CQpB2EPKmcXnyajdBUCL36QOurlwEAnlCSmojxvG
	3Kp3Pg6l+3QPxHw3eolBTeiOju4cOgdiT21eG+VY5+OIhq5KtLgXMXkDYMPB59Y9R3tJBZ00fcL
	IZhxJZyJZ
X-Received: by 2002:a05:6a21:4613:b0:1ee:cfaa:f174 with SMTP id adf61e73a8af0-1f2f4e4c89emr22116734637.42.1741017698941;
        Mon, 03 Mar 2025 08:01:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ7lQhwdPu7F1bK4GZ8FGaLSacV4bEWANJf/oaDv1AOnK27gH8LHesKf32x0Ct88uuBV+zUA==
X-Received: by 2002:a05:6a21:4613:b0:1ee:cfaa:f174 with SMTP id adf61e73a8af0-1f2f4e4c89emr22116685637.42.1741017698472;
        Mon, 03 Mar 2025 08:01:38 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf29f4sm8326270a12.11.2025.03.03.08.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:01:38 -0800 (PST)
Message-ID: <0d92ca31-c22b-4798-aa60-5feb66def31b@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 08:01:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: WCN6855: possible ring buffer corruption
To: Johan Hovold <johan@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>
References: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
 <Z8Gr-IMD-UZTU-X5@hovoldconsulting.com>
 <1f8fa248-c18a-4bb9-b995-0961f7f3fa37@oss.qualcomm.com>
 <Z8VWAWl5UdZQYGgr@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z8VWAWl5UdZQYGgr@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UeqQQZoyjcAUwAgRtWYE6BGQod2v1O_A
X-Proofpoint-GUID: UeqQQZoyjcAUwAgRtWYE6BGQod2v1O_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_080143_396970_5DEF8933 
X-CRM114-Status: GOOD (  12.39  )
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

On 3/2/2025 11:10 PM, Johan Hovold wrote:
> On Fri, Feb 28, 2025 at 09:07:32AM -0800, Jeff Johnson wrote:
>> On 2/28/2025 4:28 AM, Johan Hovold wrote:
> 
>>> The ath11k ring-buffer corruption issue is hurting some users of the
>>> Lenovo ThinkPad X13s quite bad so I promised to try to escalate this
>>> with you and Qualcomm.
>>
>> I've escalated this with the development team.
> 
> Thanks, Jeff. Just let me know if you need any help with testing patches
> or firmware updates. We have a couple of users that can reproduce this
> very easily and that are also able to test patches.

There is a patch under development -- you should see it this week.

/jeff

