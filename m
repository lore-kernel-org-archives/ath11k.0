Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344DCCD5BA4
	for <ath11k@archiver.kernel.org>; Wed, 20 May 2026 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w2JMUOwRlLFEsAUyTmDijCXInDEtyuvM/BiONWQxQY=; b=vWp2X5FdSv4d2XNpMbWnBRYUgV
	ido3gfbJhhHE5zzcL1iMSiqbuVkexFOK0zLg/5yfQtrmJ5uMM+YFXksiK2MfZiAlaNt28lHSDg2Lt
	vYWQwRPyWQEuhioHv6cer4eQh/OUYtN1llwFUzLbLYWqY8uvpvHxAriQQn/FkmZBCzNpfo8hreNp8
	5VeD1J3ofFJeFGAcKh73xPFsDwxf21h10ztd4KgE2gu1qiLPUpMnb5v8rRrWmy8zNvn+0uVsKj6X1
	xiTD1sp+/S5Cp5FjyJoZkuruHhrjdNXEN+vnGjYaGhPh15Ont3paCbDQReCYnCXkWMFWKfriRwVzH
	t46Cojmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkG8-00000005EYx-24AK;
	Wed, 20 May 2026 16:59:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkG6-00000005EXz-1CLz
	for ath11k@lists.infradead.org;
	Wed, 20 May 2026 16:59:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KG2LAl446712
	for <ath11k@lists.infradead.org>; Wed, 20 May 2026 16:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w2JMUOwRlLFEsAUyTmDijCXInDEtyuvM/BiONWQxQY=; b=k6CGpnc9c3jzCbIH
	HwWVspIf8G1GcMFik+8ocfffRn2w9NFDGuleSLdaPFZeXYOF3IAzgPEcEZJ1E+9w
	7liTTMkHMhflq3p/6ngSM83dFvMBeizgfN/ivULHsbD23MxFxwOoqR8AdxW1YAW/
	VZFe3VqzOT0Qx6gCihqvQGxCSsD11HSLFK6lj9V13kk3p2RtbC3OfPCnZ4EYKG5J
	kqvFcxWulWOOBBwqAnacUYqeMQskiaG7o/hsJQKpyGRIFSHSX3s/1WoE0Y+mnL4r
	fQ8c2o3mVpvP89zMMOnnyrSgYEazuJ3vEZL/3sUxkgZkPsPboVjEleueXHgGm4TV
	BJzPsw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrhr9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 20 May 2026 16:59:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso6270453eec.1
        for <ath11k@lists.infradead.org>; Wed, 20 May 2026 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779296340; x=1779901140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w2JMUOwRlLFEsAUyTmDijCXInDEtyuvM/BiONWQxQY=;
        b=dk+kuL7u88OeZG3uHQmqsgXsO3nnkcNaiDq1ZLBomQ8r5ulHH/yq0Vg1yXiFweCxLF
         qLejZPxGfRC0A72+hrXXuynj1KzywJL5VgdS4yvGyN2xDwSUmDbWJ6uxBOiaqKsszOqL
         WDYVLw0TcTCB73p6VCzhDxX6o0xHZuSy+lyKsxDU0o0uqH6cwzUDP+PDX320L3JfU4Nc
         1y2x2f9BDwrS5kuKpoau30J4AYhTprMMYsp2T0ZEQLERl7zjr4NPSD4rZDHOU1Kl5odT
         FdjZ65/VFoLAdJFQ+qcq2VQaAvLNFHyMeE9A4w0ORO2nyxNsX1NKPDhgcsPuG9uKd9+u
         VJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296340; x=1779901140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8w2JMUOwRlLFEsAUyTmDijCXInDEtyuvM/BiONWQxQY=;
        b=V1fzmTcgXZQNTpdnwLHvhu1U3z+zyaZ65yu/hvQmf3TRhePEnHI9JRzeaVNMxXf2Pd
         Cefl4PU9Rbe4ceXMvLYZitXqMMzkBKDSHWWkc13Tl39OoQd5D6py04slzU+UjJXMdgZW
         UWJ7sjuYK2VAd2DKoZ1G18SjNtf4+/pKBxcV9OSxcZSivpOAn1uICghb+ReTHozLtf4+
         zDi9zQndY+UyuLvxCasD4HvwOhXg/km7puDMW9pDb2cRwDfIo0+QqHANmbxgic7aBOjm
         2iCRlNBTuDK8Z+s9H5vaK+IjG6cDtNm26La9ykeg/AGH7vHHGxj7AEPo12oN4cuOffgO
         yorA==
X-Forwarded-Encrypted: i=1; AFNElJ/yO+emN9Uutcl73TtgkmmzBoFCVxNQq2RnHjbjqdLC7YjRIfvm8+72OjHttrER8WxabJMPzeU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6elSCUo1oq/laROY5b2JyGsUmd4tkUx+KZfxwdiSe3aB+Wfs1
	vVcKq/K2eXLE97sRe1YFLvtv97ynI1Rvoiv/PWr1g0k+5Vm0GNIOZIYdn/G1j0BWN2/g897vLla
	TKpaZn5CgE8yUaSEqPBFxuiSxjGx50RA8qwwsHwRglv9N+NWjkmm3yZg8zs9IDTm2
X-Gm-Gg: Acq92OE/BFE4RUoDvLej05af84TG6+3cAPvC78MGzmIvcIy04huj/sy+p3pU+Wn1/VK
	/MPAhQT41bVDOQWJfCkzBOwq5eBOIVVmz4O3wDXLAZmtLGhcaaxnQ2Ov801hwPOd9cjfViA81+Q
	lrHoHDjitbsauNPj2MWMrzIgG7tLSZw5RIeJ+tCo7dqFBWLKOvw9iwRsblTVxHTyX8BMzlDJ6zo
	/vaB0oHimrJU19KfEPO+YYPrPla/KfsCJlPYyZ0Os69wbItn1i+aDj+O6fZf5mOHL7M2Kp0xxJG
	zozTsy1+VBk/2ljdt6w/FDm7PPmAJQG5rDD1yrJ8VDmyYsacIs8nrzZUT7PvPJqEVV3ZOXQ+qnR
	DJ2LloDDVyYFdHyvvQYHGirhh7V1q7Vn14/+xi+G15/VxdL6gy3qGQaJasZH28Ja7/Oi5q/Vh+1
	ZC
X-Received: by 2002:a05:7300:570e:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-30397b9d820mr13045161eec.0.1779296340243;
        Wed, 20 May 2026 09:59:00 -0700 (PDT)
X-Received: by 2002:a05:7300:570e:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-30397b9d820mr13045135eec.0.1779296339747;
        Wed, 20 May 2026 09:58:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm19371442eec.29.2026.05.20.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:58:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260420110130.509670-1-jtornosm@redhat.com>
References: <20260420110130.509670-1-jtornosm@redhat.com>
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
Message-Id: <177929633899.2491273.3275587178961944359.b4-ty@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:58:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: bSYiqYChhDOb9DdXK0hXe1aeWDIyBCno
X-Proofpoint-ORIG-GUID: bSYiqYChhDOb9DdXK0hXe1aeWDIyBCno
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0de855 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NCj8lmT5IRo3ClLsRR0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2NCBTYWx0ZWRfXx/pgcYmHqRKe
 JTL6B9ZLo7U8N5hn9Hts/JWWmc/l15mnQZ5QBG99qkJa+IwW5Ne0W6qRQ/pEJEPdrkpaknAWIto
 1a+lNGFoOeM6T/hg8yYp0/aPzQqWYqF/RerBEL/X4VxGnnEQ5F8htadgMsO6NbxBNeMIPPLaVF+
 R/wB053ZWm+L9CW/6WApRYDrWKDvdyXraS05mIXN1Vq6oO/tSygQm02nw4aCbA0CCrSqB/cJcC4
 TDdLYE2M1VV9a5dT6fMEDURpSIG8vKtwciIyN70HT2cb+XJWupnBwfvCy3FLr7bRuAjVIYNP4QO
 HSa6ragH+0VICqSe6G4NIMonHTIBXyI6p55oGhspMzpqf45jEV1l97qwgVqPm1kjYHkGE7CLNJb
 cGWLIMmcdPzHMF/fG2mkLUQZX1b37ZOnFWJO9lvAc10Mi3e/Ga2bLY5l8uadjDiE3E49hAv4RUO
 ODfTccFs+H2IHd4A3Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_095902_453166_B0ADCB69 
X-CRM114-Status: GOOD (  10.20  )
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


On Mon, 20 Apr 2026 13:01:29 +0200, Jose Ignacio Tornos Martinez wrote:
> If there is an error during some initialization related to firmware,
> the buffers dp->tx_ring[i].tx_status are released.
> However this is released again when the device is unbinded (ath11k_pci),
> and we get:
> WARNING: CPU: 0 PID: 6231 at mm/slub.c:4368 free_large_kmalloc+0x57/0x90
> Call Trace:
> free_large_kmalloc
> ath11k_dp_free
> ath11k_core_deinit
> ath11k_pci_remove
> ...
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix warning when unbinding
      commit: 8b7a26b6681922a38cd5a7829ace61f8e54df9b7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


