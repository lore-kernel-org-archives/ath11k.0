Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674ACD4F4A
	for <ath11k@archiver.kernel.org>; Mon, 18 May 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ar/YtC0yQYN5h932Kyk0AK4el2wmEbuBZQbQvZlLCrg=; b=zWzSlJ3xsiMMAkMZuRdnIeBdM8
	CvThFsmKUFDKCikXTFfvPMhzjw93J7arhOV2XZy1aGRWPaYDgZlshY0w0rzcEIlUOZIiKhTVVIEUi
	8Ix3DgCxB4oYOlQRuxZGSl7IAkTgH7aD+eh+4IDJWe6fbBRxYZoMBCWO6Sl12mWqozTlXcRgNr0sX
	ICQ0Ynfnu9PegRd+dtd7/eAQkJArrzVThfqFiU5w1RwHq0PwKkDywzvI1iy57skaHNqguQr9vnmVQ
	f6ELj46zvJKyuiLkSqISsBCrg3FSGUwRr6iZudOL5co1at/hJLJHOe52+XZFM05deSykXBDYNq1OR
	Ye1Ub2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQF-0000000FsvF-3h0X;
	Mon, 18 May 2026 13:54:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQB-0000000Fst1-2zWB
	for ath11k@lists.infradead.org;
	Mon, 18 May 2026 13:54:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e79O2892861
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar/YtC0yQYN5h932Kyk0AK4el2wmEbuBZQbQvZlLCrg=; b=PcSYj1NOqeqWBQ8w
	Mg85/nVTCWQv5v1XTxYfP4Vkh9EIR16/1/QUm3PHHp21gNKK9NcK1n78qBRJJ51Q
	ljN8E2olgGufwIWlL+tJDTX50N6AU3aqjDn8+RGz6urjnE7KfpgMmEH7SKIXvR6d
	DyJ6SwcmtQ3pVA8kRLTszkywkVxZIEauaTmvguLxbRf+IRUDdNKUi+kagvMcjQem
	a4nm4bStLxjAehLMA2w1VUPz0LyOsUJWY3OSc7b13X64Qi1Q8RXvl8F3oU8g94iZ
	i7pkGkRkiMbcwUusEgcVDcc33GYlM+kGcNkaT5SkP1wlYidktG36qb1xIpQrkW4t
	A+2DKw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk19gfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353ac304f3so4173997c88.0
        for <ath11k@lists.infradead.org>; Mon, 18 May 2026 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112455; x=1779717255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar/YtC0yQYN5h932Kyk0AK4el2wmEbuBZQbQvZlLCrg=;
        b=WftitLcpYmALKk8SP2aEGzv5MkLMw8hXOZOT3INdj8njstNvl2B+tEauMYwWud7Icx
         nZf8tM4WbaseVucsGPmNr6Dt6KbLKPiNTKJV5Y/ZSQlF3aFR9KLtLXXCfsw6bfIaHGba
         7XfdGCDh/B1QJFfMRDsmJsYA3YW2mzLwYRg68bzqVzMXilwFdFmYU+TOff2tNWcMAaNd
         FcS1PjaYSmsoIi2ouCKv0MybQLagdVnKbboRLvyYblVLaGDQYI7OBaFJksDiQ/nswGfs
         t+/haca+Gxi9gkrvClUKSx95bppLKffOElJ1rW/oGcGa3was66kFc5rPkvsRDEjc0ZEV
         kyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112455; x=1779717255;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ar/YtC0yQYN5h932Kyk0AK4el2wmEbuBZQbQvZlLCrg=;
        b=MqQJYiN3L0hfe+4F2ZXNHELwC0ag3e8/95dYMTLJuBW2QDUaAvHx3tAXT/5VjkeNSh
         5jrMGCoFKRW2nwbGnPC/oKTmZY1GMt0H1nj0TMrjZYQyaUZPZ02VjvBlkbLvwnwhIJ7M
         4d71z4uKU5/JKMY1T0wt7FwQL9VXDSSOxM90u3/gF5Wpe9ASQWJMzrrJMTNFwGFaqour
         7zMshcdKIxcyaHFdRpQggB+z9rQCu+EZMS+YE6bd6WIuZF6ybfc++VJyYBVYSWuKXh+H
         xE5KpOf+HyyylK1gU1dtYlVbVf3Fwc9I/odDfBasOJ2WxW5jOHEXRBHpRDEXiGJ5rFyg
         mv/A==
X-Forwarded-Encrypted: i=1; AFNElJ+D45zLvG/0d/D1Ct2Kh1Bzh7lxgiWJbulmFXMFuwknZwPZwxdDKdEkmRXR0DWebNyR3hZwMXY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yypu7/34m7GNyxkDfUYjUl6J1Ld6H01rjFxGeLDO+NqMHQmmjYA
	kleI9OFgRk7srlSPZKm2WqZt4E6zafcnMcdbXky+ciNZL1yPeTUki90Ar9noDAr8Ft3t8fb9wCP
	z5+e86EDznNEaj7oPRu35FvrTJ+qx9iaqFywO2SAJIigj5laS8pDtRMlJ2YC6PKwdBImCERhD
X-Gm-Gg: Acq92OFGSeUfLL1aOZ8PlsG2sdT7etjhsLNodWE2kWdivkPiGKiK5NSGcjMpxiGtidn
	SEo2EK9jlzdd38GnAXcAw8b5LZFAwfFGOxY2yq7xEQoCndOBJu79b3sGR9+TIftdo/7gxE+vV82
	0QaXIyVjM2MxgYy3DDosi3ix/DcTfcT9i5oJ33D+mHwcaa5xCGhuGX1qi5dYP2Y8YU5VOGm5Wpd
	vymgxfujDizRW/HYmN85fJqGTQFvoJSIfbiG09PK720iw91FayJDzrKz8VOlaM7j6M7jlL2sByR
	59mlFHwl8TQ3kTnMWT/axonXEHRZewPVPYAF94Usmzc28CdFmM4qcFLO2ZyGEyQXrZIuJ4AjpDO
	Ob5N98IzF4QJvxPO6JAA3ZkNM3/hB8LJrQcipZUCnPkbl1Y3Wm1aiYG2QgcywxJs4BvIS+4JOkb
	fS
X-Received: by 2002:a05:7022:310:b0:135:5284:1dd9 with SMTP id a92af1059eb24-13552841ebemr3927098c88.12.1779112454523;
        Mon, 18 May 2026 06:54:14 -0700 (PDT)
X-Received: by 2002:a05:7022:310:b0:135:5284:1dd9 with SMTP id a92af1059eb24-13552841ebemr3927070c88.12.1779112453933;
        Mon, 18 May 2026 06:54:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm20870488c88.12.2026.05.18.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:54:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Willmar Knikker <willmar@met-dubbel-l.nl>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
References: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Subject: Re: [PATCH v2] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
Message-Id: <177911245269.2671480.662822081841670473.b4-ty@oss.qualcomm.com>
Date: Mon, 18 May 2026 06:54:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: c8-bUfK_yK9MKYMhFyEFDTjjys9yAF5c
X-Proofpoint-ORIG-GUID: c8-bUfK_yK9MKYMhFyEFDTjjys9yAF5c
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b1a07 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ljBxYmjjx4en0H8xEuoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfX964RUu3TMuVp
 +pJlTABJ98QbtTAw/YSoRiHE+JpZ2RRk82+KGdZB82BzqLnaA56avLne8PD2BuGhGBIXOSXJ3hf
 ZWKysdQDv31yHcvlr61INOcrxv2GK0PJ71sJzfCr4Cx40g/Fq36RO6qun0+FUOc86Fv4/P3Goni
 Zun9+r5toVVSfeevpfNlVzVI+lD1IrReme05vdvXQhuHNn8n+KrTTPpIVEwd1eZJH8Yvd3bWeg8
 QZdkItCPZ6DmMNDOTXS4hqkLE0WI9sXcZU7zEy+FpCY+JqLPXg8oAzLEyASxr+pmt+TgIShU8rE
 vnEt8WbJJzveAvn4ZaZrYp+xuvZnPC4XXHPWb+b+GCuL3Flb1+BAQmHLJn7p5FTJzEIE+RpvjOC
 aP/gzlFYqUcaZfEOIhFQ1jUoPP3SuA/r90M0NtsmOZskL+3GukzC9pWSTvoTQcbztyD7DsOMKc7
 aLXt5lXXeLJvv+RILQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065415_776759_49DA2B1C 
X-CRM114-Status: GOOD (  10.60  )
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


On Tue, 05 May 2026 17:17:43 +0000, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Use flag for caching is_continuation for use after the
> dev_kfree_skb_any.
> 
> Changes in v2:
>  - add bool _is_continuation for use after the free.
>  - Add Fixes, label to commit.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix use after free in ath11k_dp_rx_msdu_coalesce.
      commit: 72b8654e3b83548f64524add2e9145e9b6c8a852

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


