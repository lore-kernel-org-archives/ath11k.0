Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA4D29DC3
	for <ath11k@archiver.kernel.org>; Tue, 13 Jan 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXkl1pxhWWfkg7abcGoMjqh2hI4gBsUgUfa7xAd1HCc=; b=L9u2F15e9vTIDE2FERwiwMASzs
	N6q9/3SmSvVk5NyyFVgL910BLxDb6Fk55VTjkMh6Gg5pNuAnlDjAqTPg0VWdU8n7jcYdwJhiViNbR
	OV1YQ4rIxzbT2fvC5w0Y1uLFjvSGUKVtAIX63Sty4S0UKV7NSAXcF6bWGB7FKT+H9b+rTH+EOlgBL
	zjOXVDyWrxzC31hE+bCtLIi4f//GlBNr+PYH5sJlS0NfoRAKK0B8UqrRkkooZPC60pEqNR2Rr7kir
	KhvQkUFYP9mBtH+KWd6V4VdTxzjqvv8iZxW5Fu6QwPHDvVx+MAGWW/ntOSu3UXkgQT8xm10auWokJ
	5CtdyddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYNy-00000006ciL-3YiP;
	Tue, 13 Jan 2026 07:00:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYNw-00000006chw-3VwD
	for ath11k@lists.infradead.org;
	Tue, 13 Jan 2026 07:00:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D59QFb2835888
	for <ath11k@lists.infradead.org>; Tue, 13 Jan 2026 07:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXkl1pxhWWfkg7abcGoMjqh2hI4gBsUgUfa7xAd1HCc=; b=LOCmgVNyotarnjRP
	LYg4ysktQETM8j5iRiFGPW4fXtRYbPB+BKNtwF98HanNfsZnkXYWyHXilJj7l3yG
	50kcVtijaD36xh8V4F6WFav/U5zyByATVTtwsvULNUrbZvD5MGDMQlU6IIzcgcLm
	tNe6Xv/dcmNkiZIZulI9qvhVsBK3tL/CxIDiw5JWtU+Y8rV1MY9if1sNkZS233GL
	TfsE1zJKIIiRMHWKDWlEJsbBipVt2iCMR3O1lQbOm+VGbkiENOVBZdjSID2A2fv9
	a13Xilrusvl4sKCUkUvyEPCfgaGjUf6Gl3qjASgBhwMjIZshoHfTZdwqdjr+4ygq
	7BXf3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9r99n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 13 Jan 2026 07:00:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so2273858a12.3
        for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 23:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768287611; x=1768892411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXkl1pxhWWfkg7abcGoMjqh2hI4gBsUgUfa7xAd1HCc=;
        b=S4wNJhDPnEMxi7OxCUtquIYWBNf7AcwQEP2dbqWpEZkAgstxzF1tBApt0vvV4gesqa
         H9+X03A6oUo9LdFuY9VcIx3BVlF1G+TA0Od2wEI3Q3121pp0fjCrGFX2yocGdWi0ep9S
         YWn8ZhVujuxQIZ08mLUensZ8S1Ovu7+t2t1oJBSny/m8yQ68D+n1oBuxbpP69J/gpDrN
         KRoZ5CzCO7VsAt3T6OMBK0KI3/7BLuREgMEU06rHFhcMkf/K49/v3xjZLrkKGyd61iz/
         sf0pgDzvX/vXNPLDq8RlAWvbzhpUjcDa1dFqP7KAOYLOAJTnV1a3PyHyEuVKO3IR4dC+
         Dh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287611; x=1768892411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXkl1pxhWWfkg7abcGoMjqh2hI4gBsUgUfa7xAd1HCc=;
        b=qYuTYQll2pAZnv0vyvoucvnfGsOGY9NC2wtZ6GdwP4oF8NgytPkzGo/c19EFn6D6Bi
         2r+UAiDPpTcBYtyvSv3/dVpcGOQZO7gxur+YtExges8hikmTKMNJ2vs/7/K3k9ecud6d
         OwuzUs8OKA+2x7mgJ6ddG46h9iXH4kRs4c3UfZ2XExEoGOrXYCudT1g3mHFWhg2Uczm8
         byPp/8XhpaGPDK+Lvpzke9RdGUSKqJAzKaN6iURgVV2tWCvA1VYxBMAZTrnLH40o00x9
         WdqXZRdHEh+65Np9lF3/TpqXapL/79W8O4mPCQAA+V8OZ+bO9M2+qEj+dN/X1a7/fSVC
         ddlw==
X-Forwarded-Encrypted: i=1; AJvYcCXYxXXXzdEwQPQeG3/2PQjkdewI+mz8YEWfRGJOUsiaz8c9SsQ1+k+DPQjTm75wwfa3aZ31cMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSNeMFOsW6dTK06ZabliqTDPpVPEGxLoQuhVvHE22QKaZTCYH
	EI+qYgc14HLJqoH7tvPVvjtk9qoqqIqHdAPytc/iAxApCFSb/IjHCxa1dmsUgtB6WMGPhc7T120
	ojLyrF13O4d4Dk2qG4H5vmRIiRBqQSmMNrsPdUi4RTjDLZlPo5OBT+Vt9cq99+anE
X-Gm-Gg: AY/fxX6uJQCQeRv4iSIwq4i07I15k3NUiJn1uep8zWI4vpAgUc3fGlFEKFuNp4raOjb
	q0z0vvWLn+E1HLZiShEaG34XUSX5CqxxjrNeh1HAb+7k4Nzglix+WgoOmdoPju/8oDoqvtEhhy/
	ABADFZc/k/fA1CMa+UAP7bqM7SsD5pka1j07FhpeMLn+V5mFDruV4fEK7v+BphR6VvyF2PozlD7
	X1N+wg85OmVph/2DuMBf/stsUGvntgQS7B1QyKIrAHcwFBynoZNRaZaiSZZITjxPGxtzNxfndMq
	t5V6zHE9yo6bwbVKAHrswAulJ+3ikKg+sabNpuwRg3uAk29wSqh4Tw8B4LBBCFDutbAEdeXULTl
	Tev8cHTU/wpenNc1F7cLfG7RrHAM7kvMVZgeHfGqSaGe7vHGxS8+wZAI=
X-Received: by 2002:a17:903:1247:b0:29e:990f:26fc with SMTP id d9443c01a7336-2a3ee4e83bamr170127725ad.34.1768287610711;
        Mon, 12 Jan 2026 23:00:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoBvHv5GkG1uqzqiAt0OKhlGVz7jlfGMEmjPek3NHMbLzWn9trU/s+03Gg1FjnduZCdWlX+A==
X-Received: by 2002:a17:903:1247:b0:29e:990f:26fc with SMTP id d9443c01a7336-2a3ee4e83bamr170127425ad.34.1768287610214;
        Mon, 12 Jan 2026 23:00:10 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8920sm190721945ad.85.2026.01.12.23.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:00:09 -0800 (PST)
Message-ID: <56c6471b-c878-4afd-8e8e-d56266ca9c64@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:30:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JZAvCY2--O3zwqbc7warfpkFaQxTu-Ue
X-Proofpoint-ORIG-GUID: JZAvCY2--O3zwqbc7warfpkFaQxTu-Ue
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=6965ed7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=awC6CiPvetVZCStm32EA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1NiBTYWx0ZWRfX/ZBBdg0hzpIp
 Modt/F7RPt4wau7ikDdZEB4ZTj4mZSorIzVzj3hCC/vv9gAvamagktdY/yjuWYZG4zl2G+DGyoQ
 6L8f+3MCIVQb55SMDZkXpAHhnA1EHz2OOv/+3sfb7zYRXJIOsclSCnn/J3rgBdFOIzIFfdyDwPv
 UFSCrx9/fBtggSwwKJW+jA4w8+yhvTNnYCrwQA+6zOSPv1h3Bht1vAOnoviClrclaQRh8RvgrHQ
 GWx27GxrUu5bkY5BwvNwff/oJcLhgM1NQzfQ9BuS/L8Ni3dHdXzsx+x9j+dbGS67zWi0EPnH2Yq
 ekv0aXyizH9aCyKBFZbd3QHbiOXQ/dj7ZA8XOhHL/Ud/gbbMole+Pkf0H4mJhphNxRsNRiBjaxP
 UmK5eST9aZPuSmrH18zap8bUMT3PRLbIyRYLUwDvUprUBCPR2sYVo3/dXTltPOc6rNUbwAKQQI6
 Ktl5rHsYSe+X4imvQrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_230012_998125_2975956E 
X-CRM114-Status: GOOD (  16.27  )
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



On 12/28/2025 8:44 PM, Alexandru Gagniuc wrote:
> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> is initialized in, core.c, a different file than the array. This
> spaghetti-like relation is fragile and not obvious. Accidentally
> setting ".max_tx_ring" too high leads to a hard to track out-of-
> bounds access and memory corruption.
> 
> There is a small ambiguity on the meaning of "max_tx_ring":
>   - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
>   - The highest number to use for array indexing (there are 3 rings)
> 
> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
> instead of #defines to initialize the length field.
> 
> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
> so use a constant to express the correct value. Add a static_assert()
> to fail compilation if the constant is accidentally set too high.

Text related to static_assert to be removed accordingly.

> 
> The intent is to make the code easier to understand rather than fix
> an existing bug.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

With the above minor comment addressed.

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

