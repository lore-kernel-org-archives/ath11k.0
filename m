Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71F5C02180
	for <ath11k@archiver.kernel.org>; Thu, 16 Jan 2025 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24nISJijUcfm1DaU1riZNqU7FdKoSISIyL0HILrjnYI=; b=G82L4jJ6eoRkfz980nv/tpJ/Wh
	MHqaDZPL5tBl7FJnrIZiGlOm7xOa//wYFKTd7BpS8f1feYpi5S45Iboc9aHqOyLpLEjNiahB43Vpg
	fawqs3DUl3IEgHsQrz4fsQmKkoeRFuKwocqR3xeU7loYQql6pe0sOyAsaWw28R/dfvYl1WfwEIe6r
	dfjBy1jv3iupzAhFOVLORL/yRdgcHjUP+E6BqkgKJVCdiTzNx/eTvogVpDK17LAQsvxiHR7LGcjcm
	Toc8F9wCgj3l7B3awHUKJwU8PPqTXX5GNoM+ZTreRgwfRSS2DqVkz4B120XTKQNoMXQAVGuio5IKf
	lr1pAR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDnw-0000000DSjl-1AWB;
	Thu, 16 Jan 2025 00:32:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDnL-0000000DSa6-34KG
	for ath11k@lists.infradead.org;
	Thu, 16 Jan 2025 00:31:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FIonaM007916
	for <ath11k@lists.infradead.org>; Thu, 16 Jan 2025 00:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24nISJijUcfm1DaU1riZNqU7FdKoSISIyL0HILrjnYI=; b=OBgdv22FRf6desKf
	bbMT6wLKlsP0a1++ScyguuS9t/8XAw7QoGZChs+i4k0y0QZ7YIqsEHoOXQM5pE7V
	VcP2QIIR/NaiUiK7215EBAsSdOGhwQDC0ImgFCTXcVysUqAhREP+UVFZZgGM9ST3
	ijUSOvGIKyWZDnU3MKoxsXLA6KmyK2WE3WJ/pMd8SOMTnTmjvFVG4RiaAeNtHodL
	FYXQzC8Q80dAsKjsAIcKBe5cKo2QRv45Nngmc93lEkr6LOIggTor/w0//8eFgQ7t
	MDRYjGhBdUwtbxrccluNOnKcOK6PMCpG+JkotyWkgjjhk6QDFDprEOnukww1ctci
	0XcwYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446jndrkyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Jan 2025 00:31:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216728b170cso5727365ad.2
        for <ath11k@lists.infradead.org>; Wed, 15 Jan 2025 16:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736987493; x=1737592293;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24nISJijUcfm1DaU1riZNqU7FdKoSISIyL0HILrjnYI=;
        b=OX//DCA1o+pqyGP9OIOwPPAAb97B7rhh1uA4vsFNy/u11/WvdAmTmG2hP63lVhsPIm
         ri+Exez7kd0Gl1uDnZjwCFTMXuq2/fhkY67FuLd/lzrrh89DFA1KJfE+Fq96+VDewEdt
         aIngXTjj3lwWyR09iyjyYVr0WZAA2a9dd8M+q7P1A6i5ABt2qeH9vNWBuqztJWXde8Eh
         55I80IqJhomohQKtlkL5+QtxVieDjJTBDhycci2RMxBrmMiYcfqJ/7ft7mkAEGVCbIc9
         x1aa0E2wA1bHB1pLy0h94x10qGaqld/8CTWmdnA2aMmid1p5wzNGMAc241ZhMa5AXZO5
         ks2w==
X-Gm-Message-State: AOJu0YwdrCx75V5eJ0+ZHpoukxAp3J+2tejeNpQo23jWW5xIcnvE70iZ
	bWvF5Y6RNDOH4sDGy7wDyGvu6XBeQPpzI6WDoADw0J1V5F7INl7fc1/AM8udN+lUxHg+QFqPKYy
	CYsAaUbX3Y8tt87cndioI70+OAeDvtZtDlXqGAAqABwTYT1zn7eUq02v0vG/b
X-Gm-Gg: ASbGncv4pxaF2UcTfNqZquF88UKbXmUzWOXZRTBufIzMsXL+CN5943ON+3B6KG80zfF
	Z4UlDbRJgd3SgaOkuy+ColELxYwjw5xjtKmN+aWIBDr+Nt2FId7f2od8JTtkZenb19+cOqcmfO3
	RvMFwi1ESdYd2vDaZ1qVBArn2vXd/asIC5tiqS2lP/EShaYMC9Pm51EhkhRAapTQzWm4pDzuGIF
	0KawXUeJKj1tdsxXDgZVhZyfUuC9MgH6uqvoK5XH2A+OLyTBYE6k+XspUjxAdgjFl0Pzty8UTlh
	7j1UxB74U0JYWQysrmJ7FsRqROaJxG/haRdzwXCPt2vvlRE5bA==
X-Received: by 2002:a17:902:ebcc:b0:216:73a5:ea16 with SMTP id d9443c01a7336-21a83f4c84fmr481845895ad.21.1736987492620;
        Wed, 15 Jan 2025 16:31:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDDEx2z8NZI67rabI9agp2qZu2Vs1vvK01ocV4Ucfq3ZanE9qLVvrZo18SctGSEIfpAacFaQ==
X-Received: by 2002:a17:902:ebcc:b0:216:73a5:ea16 with SMTP id d9443c01a7336-21a83f4c84fmr481845545ad.21.1736987492221;
        Wed, 15 Jan 2025 16:31:32 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d13fsm87506545ad.188.2025.01.15.16.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 16:31:31 -0800 (PST)
Message-ID: <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
Date: Wed, 15 Jan 2025 16:31:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, quic_yuzha@quicinc.com
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        quic_cjhuang@quicinc.com, vbenes@redhat.com
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250115130359.138890-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 71GPF1vJpLVyVgDkpA3yhY0BldmeCzAN
X-Proofpoint-ORIG-GUID: 71GPF1vJpLVyVgDkpA3yhY0BldmeCzAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_10,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_163135_786239_53A704F1 
X-CRM114-Status: GOOD (  13.59  )
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

On 1/15/2025 5:03 AM, Jose Ignacio Tornos Martinez wrote:
> Hello Yuriy,
> 
> Thank you for the information.
> My platform, as you said, is just wcn6855 hw2.1, but using NetworkManager
> with the default configuration.
> If this is the only stopper, you can skip and not consider as a wrong case,
> because (sorry for repeating) it is just a matter of the number of available
> resources that can be adjusted after some research from us.
> 
> Thanks
> 
> Best regards
> Jose Ignacio

Thanks,

I was hesitant to take Yuriv's patch since your problem was not fixed. But I
guess you are already broken with the current code, so I'll take his patch,
and then we can work on fixing any other issues from there.

Kalle, can you review? You currently have this deferred in patchwork:
https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/

/jeff


