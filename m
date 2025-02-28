Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C1C282C6
	for <ath11k@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w03EvNkmgGsEYw7MVxLcdlGbwxuHVUXTAOgcgpkzv4M=; b=0TSDsThGRI5XyfqgOUNf9Tfj8V
	7JBwC60uVMOn6lxq4LoVsIRlIs6dQzgkhHlSAA2Z6szi4zrBDyO0okDwFOrajOYldkiJ3bvQGzJ7p
	+x65RCamOxLH31r6yIvt8OOJFoMwAaoIjNcxQd7RQ7zEaPWt9oTdiaMD1naO5D86Lfdv/tzbUzhMu
	mqtdNJD7hZ8T3PwEPiPJXt45yXXkteXKjLGyjOGa1gj0OaV6Mg2ydXDtzXbRRFoqnfvK2MPa71amx
	UrP6VPdRM14Apzin4WSfkcrXU0L39geoWaymbLzkyAVcyqFSXU0o/MyZabw07ds9AB2MYl/uUJ9IV
	PKDYRIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3tG-0000000BsDZ-2Q0y;
	Fri, 28 Feb 2025 17:11:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3pn-0000000Bqvv-3P7D
	for ath11k@lists.infradead.org;
	Fri, 28 Feb 2025 17:07:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXHfV008953
	for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 17:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w03EvNkmgGsEYw7MVxLcdlGbwxuHVUXTAOgcgpkzv4M=; b=RvaEOCPP2CqdlTEx
	YmICOPsvT8qDNLF/rY03JeVucRCUWDlDCxk7VMqdR/MKLLqCZsXsFSL8pXs/Stjb
	w5jSTiS2EyM84aqSeEzjMizz7qfRwGIeg1FmaGj7JZyuVWRX8TxniWWNJvO3RjhD
	8ElwnNl6jLWk+jaPWohPyzmyv6zBsONiYpv24Sbz6EjcZTeGBZMbx4R2fKJHyYo9
	hYidZ4SEDB37DSwiYfUsvCgS8rPQMej4jDRRKVXyBzEscxw42QyGjjf7BoeY3AgQ
	OzsV7NQq5fbl9FNt/8gIDR4JyhTDu/5rqc3aSeoT6YcxpnOHWotPJwyMdFaFrI2I
	MKSSug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6pqc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 17:07:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fe8de1297eso4935840a91.0
        for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 09:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762454; x=1741367254;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w03EvNkmgGsEYw7MVxLcdlGbwxuHVUXTAOgcgpkzv4M=;
        b=kLh9evnX5ak85Cs9UMPgY34Q22z8vdsWzR3L2dYBMQP9rWpz0IJhQCJ2AC4eRDxQ8Y
         eFn2rh8ScNMzAJUczXH4Z7YeT+0HMeh5lSlQmrVKYib3cHymvqK/oFoyaxF8myDa7Kqq
         Wprr+zMIPAJzRSBKMO/jBLW9zOM+66mFfIJUler08Sq+Ac4O8mGUL4wI5oMqGd7jdbl4
         Ztpx2k8WQJkTHRMFllvfn4Un6fSQvnxrdNXygv8Y15qvRWA9mVV1xGR13E105RtJDN2p
         jEbMM7lO+A2XvihWMDwlb57qC5mX27X5VJLTxuDusbl8qyPgDMVr1HC3QnP2FwJjMeHQ
         cG7w==
X-Gm-Message-State: AOJu0Yx55D2qG+p2R0taML21gsg8O1TmrqLn32ZL9+TPxs/KnD1aRpUc
	UdEFdkg9Iebj92zCoIgV5+ZwbG5DZmwepfO4/l9q8PvFZUfiJ+TSP704r1wZ/UY0uXnRHH+UNZ/
	xFyFlRRXqveb0uiIzOEklirUV3y9OFbARmntfNc+nrdFBHr+ivHHQdVLIsBQL
X-Gm-Gg: ASbGnctnIh2cusPPOCSU9G1joPKrnMz423gVz3bizaRFSPTIEQJkJEPOwKRJ1LrUJsT
	p2f2GB0oQ0mftjIWsYDH6vwXtpEh1dRZ0d3sTgmv7lkTrStZk1WrC1D2t/U4zdwAIJ9ATOFpsqx
	bye+n4H1Bb/A4KY08aoy0I7Xv9YXEwRvEsgPoq9HKel0Te5AvRPaGswlppNgNrs/LMuOb0Fe89y
	YLrsHzgD+1v0Ne+NjBJKOYEylWPI969XecRsKJa5Gkx2QN0bAtjacww7jZJLLv7VyFl02dulDrk
	63ub5by6oKlCv8BfHK7p1X+dlnyg9HaDeGTFNXJOoi/lIaa6CnwylABNKqShosXzs+S0DM2i3cm
	vU0Ja9QN1
X-Received: by 2002:a17:90b:1e51:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2feba92bfc9mr7182355a91.14.1740762454218;
        Fri, 28 Feb 2025 09:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4woKH6wlCEHEAUo+YddSp5Hk9b4m/JxWUHwlF3vZcka5jmfSVtvgX0c8jPPD9KSmBmIjhjw==
X-Received: by 2002:a17:90b:1e51:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2feba92bfc9mr7182301a91.14.1740762453739;
        Fri, 28 Feb 2025 09:07:33 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea679dc51sm4036250a91.21.2025.02.28.09.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 09:07:33 -0800 (PST)
Message-ID: <1f8fa248-c18a-4bb9-b995-0961f7f3fa37@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 09:07:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: WCN6855: possible ring buffer corruption
To: Johan Hovold <johan@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
References: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
 <Z8Gr-IMD-UZTU-X5@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z8Gr-IMD-UZTU-X5@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FFE9pUE6ykgsUbAJ_bPInhiXR1s_atyQ
X-Proofpoint-ORIG-GUID: FFE9pUE6ykgsUbAJ_bPInhiXR1s_atyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_05,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_090735_875141_EF3C0F80 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

On 2/28/2025 4:28 AM, Johan Hovold wrote:
> Hi Jeff,
> 
> The ath11k ring-buffer corruption issue is hurting some users of the
> Lenovo ThinkPad X13s quite bad so I promised to try to escalate this
> with you and Qualcomm.

I've escalated this with the development team.

/jeff

