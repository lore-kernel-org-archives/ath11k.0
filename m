Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5033CD8CBF
	for <ath11k@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=Onxp69cbH97nAhQdbcgxieou35
	duaoReHNiVRem0ARb9lVY91ZtzDEVqEjxadEdeHyUNTQbCg6CScOzN5qNYuOq3NpePx+m9NTiToV3
	mVu6pbYwjDNI2FWahCAQEZzXOs5S11K+7qMQqRrBO/UjxjxxRp01PFmwEqCoJNlGVjG9KF3svBsDp
	5YD3YBBu4LTFTfvPulOQlyPEVcdFYSrOjKIDVGd4aJJYIghw4TZ2//KlAolxObCkCwRshvGzWK/sl
	i+eYrqGdgXWxg3kNpJPzptyzpP85HWU0ejCJYWf7yrTB0Kk65aVW5Bc+ElXUVNVxjIlNknMPhBAV/
	NX0LUUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvC-00000005iF2-49xe;
	Tue, 09 Jun 2026 13:55:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvA-00000005iDZ-13oA
	for ath11k@lists.infradead.org;
	Tue, 09 Jun 2026 13:55:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClOPv2249695
	for <ath11k@lists.infradead.org>; Tue, 9 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=; b=psIJa4hwrjT/9RRi
	WMl+IQdnpcyeDVvI/i5tCQ18DZxeWQr8JXXopWK1ZjzLlO/wcQzcsWkOk838yIPa
	QBSVvMQKdUt/BhPJPwTIni1WewXMwj+yGTCAE+lTMS4JjyQGNCVSskgfif6OmnNh
	SuyoNtAXpfR02A4TnNXrFJAiEom9YzABCttS4NvB86pNx3sPbftTcTalcQNNcH1F
	WIbRgtPFtVjYCrKeir2EdvRPtNlIO4O8LDQDjk9LeI8B0UxFFN4dkFisdYM+4dWN
	BMTE/L6NRIfi5bsl8fD/Uc/PI8Ma5gIhUYPt3I4RQVU40iG0myViCpdWQPIOt5mk
	e8373A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wh4vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 13:55:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-138156c0492so3289435c88.1
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013310; x=1781618110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=F2DbvnWk/0ghEawstCY8D0WWhGA3feN4Tui5fRbfTZUwzGpfGC92z8nB5ITbXQSouf
         d8/6FobBuBhI7J0g/ZRTjKQkk9m70HOYnmo6p05gOVGiu7REKpa7s3qiLHy7ocqookga
         pD2v4vcoQByAFVL5K1KOeKG3lGTq1+fDPERdxjPdj2iNWfrH9YP4m0t+v1yD9Mu89Mk7
         vzX6R+mvp9yKOwnV8+AvfHUpI5J7rb1ESrp5JomUAakshou6APNeib6/bmLBEddUp4of
         3G6L+goF41g7HNlorFOyD/BUAJj3IBwhmVrs4BxtoiHQBJ1Qs5g9g5uKPNsWAs4Y9fRV
         zJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013310; x=1781618110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPUhQU2r01fTv3p26ZiHt/lae2p6AaG41ksdfDwY4IQ=;
        b=VtQ0VXfwidHJ11CMg/8WH99zfHy+nLtCq3wqrkfUYR0KDtVW6RgAB66p1sReFVLtQz
         x++3AcLSrZJU9H0wLyVwMHPBpFNGq1uy4FT5EpPk4AN/dLcteQMwWMRmtKnWcA/oF8Z8
         eAOewP/cIcOrRHwWKdEZ9zEhU0MWjFiIEWTfu4Gbr0uhHilctMA2IpqXkm3qrGkmeVMo
         q8xKf4zI8UT7rCgU1/arSh+mAkkPLi90aH5y105DWIMY4iSOyXB6GIeaegVTAGqntich
         pZBa6Og7Pkg+RCpNOZb3OxbTKXnxNuEfypHNjMZdsXCwPAyEFthq2hVE6u9exJxYYT6R
         Dd1w==
X-Forwarded-Encrypted: i=1; AFNElJ/W+VStFXZtez/d5zSIih38u/WF4vAUU5T1V+WhBUYc8AQ4S+dIA3ODoSRn99+WgaGOnV4cl1c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaoCk524WJMDuzIxhorwoho8/Es9aG1ZCg8myEMmiviXZ74q48
	U1m8O+9UxadhNzhHX81ljOHSgijIykY8t6AmNnJT+NAv624ANroTo3w0ExYU2ISywquOUEQTz3l
	TNVNEoRFudZjB6HQF9B2mJggYkxiHYnhhQFnc3s2k4hkEP3Sa14f5ifJSzALkUqqK
X-Gm-Gg: Acq92OFhuSm2T/2FI5JrSqdBNTDlzw5uKKGLQRfdekXuVYj01mnoO9M3MrXdpkOnGJK
	FBihCf8Ijc3e3NCWuVJwCj9bTgECo+gJS+wnPheRmvcgqufkJdPz1PfW1UKSgl/NEzVFHIp9NFo
	AJ+NW8DAIn29X62+kH9Xe1EAXGUy93o64Rg6U7pZ2n3Y2UNgRu/06xIW9tG91K2NLuAvKGHAg/O
	vU7TvZm2Ds9RzIeZkfVvvArwbujbJ7LpnDkCgbNqSSUbaI6bg2Q2BjU5KF9UHa5uyfGuPWUX3D3
	j9vQG4xQHcNSia4yc03L+B79gfmoxDBxunxc5uRjZNUlXeK0Mw0UVPfkK97iFPHQjShE43Yw6b+
	X1YIX4lXDKPNXLkSwhvAHJ+QGVk2pEjQehficZap7HZItsC1qlmLsZLIOPtnXfD+DOGwK4FtCIY
	3AHncNNIUQdhQ=
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859161c88.28.1781013310231;
        Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1380671c90amr10859126c88.28.1781013309570;
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm15289555c88.6.2026.06.09.06.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/4] wifi: ath: Update copyrights
Message-Id: <178101330879.3249128.7536641999721220001.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 06:55:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfX0R9FDRoxLUtn
 zNdZFgvN83qZt/1w2z9P9OJPWK1jEXJ3A+yZ67a1QMtFN2PDBpnME4axpX3bhdehNkZELhfQiHF
 5JglsLEBbcuKn8Lq8tprrHBpZ+iUBpq92ec47tp2x2sgH2glvB6WYpW4n5poArbMJncs3cwwitM
 +PzgA/BpilcJ7QMKumKOXD5GOimvIPSrc5fX5KBXdYy2QuMcbkrRzx2/akb1iqPB0kcv9SdOXL5
 5WmbW52u110n0GTOdvZRJBYFBSYTFtg8mmwzvBcLLU1FjI8n1riIcFG6/XAnmZ7EPGBIKZjbu15
 QtVmKaFpk6wCiQXBtDDZmAqcJtvsMg6sA8+ZPfMma/bv/g3S18rCthxm7StWLecDMg8Ou5c2fYS
 OWxlhkurjBK5ibLAOFdYBxHGA/s1IHMqlqnuuw+k5tNj2L7WVfFug7DA8qJd4donnWsrQYb1NNa
 7DECYyNVu8nW4Cr5EPw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a281b3e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p5YVH5xWJpdpfVUbqF8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: myGrlk9cnU5xPVHnrPSNjMui65cMWJnb
X-Proofpoint-ORIG-GUID: myGrlk9cnU5xPVHnrPSNjMui65cMWJnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065512_313201_1621571C 
X-CRM114-Status: UNSURE (   8.56  )
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


On Mon, 08 Jun 2026 06:21:31 -0700, Jeff Johnson wrote:
> Update the Qualcomm copyrights in the ath wireless drivers that were
> substantially contributed by Qualcomm using the current guidance from
> the legal team.
> 

Applied, thanks!

[1/4] wifi: ath12k: Update Qualcomm copyrights
      commit: 1c316d02c399e5efb1279666c078f99b3f72b0ca
[2/4] wifi: ath11k: Update Qualcomm copyrights
      commit: 053a93808d4654fae18633b01a747caa7a281aaa
[3/4] wifi: ath10k: Update Qualcomm copyrights
      commit: ae667b0f98b80146ea22830a1b53c5758ad742f1
[4/4] wifi: ath: Update copyright in testmode_i.h
      commit: 21d83c6e9e45156f4cad8c7cd6fc2d5bbc76f73e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


