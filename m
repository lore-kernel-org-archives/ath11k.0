Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC2CCA470
	for <ath11k@archiver.kernel.org>; Thu,  2 Oct 2025 00:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GDoVk13gSG/i7Fk+1oEXTyiKXG2tcind1n2mdBx0yM=; b=Ji5hBPOL4bYBLMKHecc2CDMtYI
	ENaqBKlMmWrf9cGsP18x17JQ/CpTezQTSlj34meMofIo8h3ZeahfOcpZS1hMBJhdP1GOIktCrnk6X
	fz3T03zOTNITqT25MXoLFpkWwj0ggdpqWcscqRDby3ev8uTgf1S8Neo6wlEKw3cvn26Ky5x2gINj2
	kX3vjOPZq7OnWa1HyU76S4EqO8TC/yfFPbQvSfW52QS51fGESRMiS56HtEF/XMw9aygNYXE4OCAmn
	q+ds04c+DswSvOdFmqGSeGB5D6kMuAHshzgl2uxxqcpBZLGrvNi55tLOGlBybnIYfaALcuMMlHuN2
	SeNRj97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46vP-00000009Hn6-4BrH;
	Thu, 02 Oct 2025 00:12:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46vN-00000009HmZ-2Nab
	for ath11k@lists.infradead.org;
	Thu, 02 Oct 2025 00:11:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcKEB012858
	for <ath11k@lists.infradead.org>; Thu, 2 Oct 2025 00:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GDoVk13gSG/i7Fk+1oEXTyiKXG2tcind1n2mdBx0yM=; b=KS95loo/y8qOm/dE
	01LB619cZ5MNkJgs0osiIJJCqF5eeKWI4BYig5r6Dm5yaMSlgwvPu7pJRr8xb9km
	f5UEyMH4fboNvRj0TSvMqt1Yhl4Nc5ejdqyjtGVbAwtpqxSvhoXFMq7YVzJcnGXr
	9sFARGQ+XJQDleeT8fSidYWISrVtg7M3NJj7oSKMozWsK/eFYJhfXLFPDfgdxqBM
	lIxsBwGPaBT9cbG9oFJA8e1wNjjK2ErhQuTUhCJSUrvrLLGpKTNIQ1x731IOd7Dq
	ou6UUEV+NZfGQkN5whdm5hEn8YXWshhoJ//42ZXIP7Nui9wQh/0CYvIvzAKDgLoI
	7V9Tjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80txcqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 02 Oct 2025 00:11:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272b7bdf41fso4423345ad.0
        for <ath11k@lists.infradead.org>; Wed, 01 Oct 2025 17:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759363915; x=1759968715;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GDoVk13gSG/i7Fk+1oEXTyiKXG2tcind1n2mdBx0yM=;
        b=h3eRR4cFDGiaOlOPSN4UYR03yoGHsMN82D1t+ouoekQdMEeVU43+Wq2LgMEOSRhzJ6
         l5aavxQAxyCZ5Sw1mNFzeUEnjmY/BvPlylSIRPhHqkWqZf3OmQz7UMpJATwCMvraqUbz
         SwJtonTKBBbkrwPJf+wg81dH8BelL8l+gVEOVIUIbvKEtGgllbhuUqk1M93UKQqffsf+
         0Z5qUW8oIaoW/o3KYs3zoBfAj8dxjlYjKW+Oafb2ny2eSTg6W21vdUSl7H9h/qb88ZVf
         dLGowIZIRIPbNj0c6PfcKBefYzc1BU/Tnw7iC8AtNg3uEnpkqhd1RK3IqN3uwRm+Si+h
         Rosg==
X-Forwarded-Encrypted: i=1; AJvYcCVV1FNv2aRrZAAx+p9Sh0Q9E5K6+oBUDVQNHOlCRaiyHEilABklA46wJAberHY82eEGPvY5SRM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvcG3kG+TQG0vuSDet8kbsEL3eLLm8BTULmWWce7mxU+v489p
	SWj2eRefGPz3bM9UKqI4/q+/6UbR6xtddGICHqueWvz0E7s98w7XdXwlFcuNW4oW+qbY/tnxi4j
	vPL0iqLbC7ZZKajiHdvzR5B80mfrAD9meTNoyTIsnyNLZMGJGgJBxWO/vd3eXDhwr
X-Gm-Gg: ASbGnct68IHHrdG56fX57uOTBXsSSZeEn5dvW2MWkTzGAzcXAI8BgZoVHyMoMYC+6pt
	/ThXAjfiJUsMlGJRWU1iS7RqG57RO4W/Nr1B4ntP0W7T5b2uSbUjt0tEvupyUnro/qsI6klpOK/
	TcKA+HnIUaIPn7ibjm6CsuejgFxfgmlIaMbqXxQH8XRisQsO4uQVxtEeemq17QNxNF3vbrCXvw0
	ZZL3HVCwcF5A732kdRrBAGvk4ArCcyuxKD79118dboIE0U3VZUIYwt7Iyr8pRPxcFoSt2jnyC7M
	IgO6ZrnpazZsPscGkTOScHt5yo014uGb7xQ9NW4nmVsIocMP6B0KMcXggl+yV2EiyCQ7gjCh4GO
	ID3qLRxqGrHvErlIxDPqw+iAfrtcgO46eiIBekIFboA==
X-Received: by 2002:a17:903:46cb:b0:275:b1cf:6dd9 with SMTP id d9443c01a7336-28e7f4b675emr59642985ad.52.1759363915277;
        Wed, 01 Oct 2025 17:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvke3HKqMMoI6anLw/qniZeIfk3dGZdV4blSVdFHttUYs84VjI/N9gM+/VbkK/eJlRr7g/ZA==
X-Received: by 2002:a17:903:46cb:b0:275:b1cf:6dd9 with SMTP id d9443c01a7336-28e7f4b675emr59642655ad.52.1759363914853;
        Wed, 01 Oct 2025 17:11:54 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d125de3sm8032175ad.39.2025.10.01.17.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 17:11:54 -0700 (PDT)
Message-ID: <85b5f6ab-a372-4ccf-b41f-67c1d22df3f0@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 17:11:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk table
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
 <83de6105-ef4c-48dc-8960-430893ae253e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <83de6105-ef4c-48dc-8960-430893ae253e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX3dTw4y+sf66+
 oMXDPtcUjmZFlJVKPsEI0+UtTfbcBr/L03NM57qOYjryIOUtWwB9+ExTiExIx4ZG2tDNU0qLTeS
 GRJgrD7borbkqQ9gPfcC05YMHDTp7bUT6DfKTvnma8t52KhrtEdl1cpvd70xcCN71N+FIOjFiLF
 mK8m5i6k8lq7CYP3s4139HdrbDO2jhdLomU7TubMhWO2wqZ0penmXoB2a6g/DVjvSn97T03h7sy
 g6oam+qW/TNOEP3BAx8fbJ5tplE2E/LucjW8/xc5dxCmag61vFYOPUgx9dEGs10TJmGANlkKxv3
 tZD3b4L1nQDcD68UtaTYGCgj4ZbwGj6GzBUGj+2vKGvTBtySxN/O0SRsgbg9n8vHU+hDiAU9RUJ
 +HInjf6+Bzfsy1RkwYkaisFAkO41RA==
X-Proofpoint-GUID: ChutqvObOcVq2qmPKGy5ZJa0rKb-sFlB
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68ddc34c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=W20sZ97e4VelUkZbdCEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ChutqvObOcVq2qmPKGy5ZJa0rKb-sFlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_171157_728363_21206FE7 
X-CRM114-Status: UNSURE (   8.35  )
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

On 9/29/2025 7:17 PM, Baochen Qiang wrote:
> On 9/30/2025 3:21 AM, Mark Pearson wrote:
...>> +		.matches = { /*P16s G2 AMD #1 */
...>> +		.matches = { /*P16s G2 AMD #2 */
...>> +		.matches = { /*T14s G4 AMD #1 */
...>> +		.matches = { /*T14s G4 AMD #2 */

In addition to Baochen's comments, in my pending branch I've also fixed these
4 instances of missing space after /*

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=79208b9ac68a7e71ad7e60cc37038c35b2b4252f

