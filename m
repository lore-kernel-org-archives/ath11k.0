Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DBEFD9E0A
	for <ath11k@archiver.kernel.org>; Thu, 26 Feb 2026 21:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbiH/+nEZ4GgL26B6uU9cZ1E1UTj1EUd301+yE3peO0=; b=QZxm174MMIVvGqwMWVVtD28ND9
	jr5I6bAg5bpXkSy8ikWyD665vcEmlHWCYyEgatzlhZ6b890QK2I42XnkIkYH/OI2GKUYnS8gBNpfT
	KeapQQXZoazHJ7yATwr2Ij5kbqRBI+ybO3ik5I32cc7vb8zbHYdqGssNiDLmfvQ0tCuvstdH5GmZx
	hJNB0aalQxOK2wBJrZohoni0zO/kuXCzzIDxDPmHsbbKAwR6Gq4dzFDfd0Ed6gQaCfDe4GvUOzn46
	yokcBRx9VDuPGOWeQhPLbml/0VVEi5DXV0xJvKSK4q6upzBtTFy7HzvdPGDGxiayhv54UoPGw8e0/
	tRT3Q3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvivA-00000007FOU-1Hce;
	Thu, 26 Feb 2026 21:29:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviv8-00000007FNP-0uvw
	for ath11k@lists.infradead.org;
	Thu, 26 Feb 2026 21:29:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QKFZlq1641724
	for <ath11k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbiH/+nEZ4GgL26B6uU9cZ1E1UTj1EUd301+yE3peO0=; b=erm0YZ01hqsdVYM0
	2Vu8ygVxEYHyhKexdXSVF75Npzxa4vyPyVQ7y5d9y7vjAbrO/uVNAFfN+T4wY2wz
	Th8tCXnUgk4I9OwSpjjbudDzsR8bVHURN9eal9rOhVs1FqkgbLGF+1O3xZs9U9G9
	4Uqq5r2SJ1QtBvHJ1BnxnKBaybOjUQAzM5HOwMfHUxPakp22t50aL5KEHtoLLbWE
	IA2EB1fKP15igUjxc9X+OkNmauNlqdm7fZwJSHsit8/u/MHBucfZLVnjvuXotbts
	CT/1HzEylBWcPj5B5nnKliLvoKMNxrCxIUMN0CDhYBSlY9SyeyOTZRvs2HgyX7Wl
	ik6oIQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw2387nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:17 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d475e17bd3so29725122a34.1
        for <ath11k@lists.infradead.org>; Thu, 26 Feb 2026 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772141356; x=1772746156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbiH/+nEZ4GgL26B6uU9cZ1E1UTj1EUd301+yE3peO0=;
        b=FNKVtnKB2dbrzTqwL9ePfkOmZGBOp2agzqt8Toq121mqPm1oN3y7r4VmtHcSWNCeDE
         1H4yaW55nmA0wEZiOidWF+T1GrpqCXjodVMbL7zwMn0A0TCQKoB1pXfyU1SIqSWhGQGx
         cFhf7R0/UoMuaNZ6mwNsOeI6nOmz+9W857nQKbHAdAgs5xAp+3bMHe6PwhNnaced6ER4
         EGpmYfWllw97pSCmEd0AinaOc1nzgFm+2EOr1RoDbE+gxEQQ5VVfLHMnpdqmM0ayQe/c
         lwY2caYLhZsycV+xM81P9ML2KoCWy/KUwjTDZEGWeXxeKge2HkNbEzuubSwQ3CKXpU+g
         e/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141356; x=1772746156;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbiH/+nEZ4GgL26B6uU9cZ1E1UTj1EUd301+yE3peO0=;
        b=knlaA/dPuc3EThns5UWtu/aDwcleTp120MCcU0QHJ/vn8qSvvxkHJD169aPK1tsIlk
         VSWr9EVTvcJo9GNOdODnRKWa7NcNJAXCQVoIfltly+e80MLD4zLtt95vV4VDuisTDmA6
         IyCrsW0Gd0663pF80L0dNQPWCi3/MWzEgUmJd9dpuFxwWR64rBnO90ebM0cgTkFTuwCE
         duP6S0T1y8VP0E9nh4lLDRZWxHRSIvM62aFzNhFM1bm3WwOLQHdzmiK+sKrYg6l4CFd3
         R1l67L7L7DbWA0XpMB+a/AUhVoeHFiyUGD2Pt50P2/uBmxhG62ejlSaaUjbvlrCMWNrD
         r5yA==
X-Gm-Message-State: AOJu0Yyc2ZdO3kMhxssyn2ojChJ7qjxBVh6k3DFPJjEeCkaiXYxCNEYB
	Xa9Q+8Wkn5Mr41uPrVpocdg5JwfyWsc1OtgKIyHJ/IEXDSl8MvClnnHUvKeApVTaXS7+XzCpTK1
	Qu81wVAMcA2n4n28S+uKe9hk3GxpEfmyCucg9kdfYoD6fRWb6U26IqnF8/47groKHiPOuwKbu
X-Gm-Gg: ATEYQzzfcry14gSvA6EbiONRKNpx/2p5gbKC/e2ceg1exrFcMJu7sV9Jk1jqC8Ifdyo
	ESM3K5Ij1N3JYP9E5p1XIck1Ej1k0+XDBYo4tfShTBY6IzMnCg9HiMJGcH/yYWg+KT6uj5gMHe7
	nenL0/URYXUeJ72jwyMjoX/onYkUkFdyAH1j9GqU2w2mqFe65h7imzYzJx/2hkcxu62dMpuXhxf
	nZemtyeye/aK8Q28zmm1qyw5J3tNYtdK1GX4yqyv1suqdJJRwla8Kq7aYzMyupJteQc+nnpGimP
	KlQDSfs+p9s62Wn+QvuL9wwIladeiywS/IWFo0EwnhniSH/m2l4Z5brrDeaxanAU9SZQfhpIBE/
	p9CyoB+cFX8DxapFS/examBDN9rzkx8xUBO3tuxaGtCgPKgAlYj9NylTQ84D0VkCcfZntbXptAq
	fO
X-Received: by 2002:a05:6830:4528:b0:7cb:1260:155f with SMTP id 46e09a7af769-7d58577615bmr1704002a34.16.1772141356523;
        Thu, 26 Feb 2026 13:29:16 -0800 (PST)
X-Received: by 2002:a05:6830:4528:b0:7cb:1260:155f with SMTP id 46e09a7af769-7d58577615bmr1703993a34.16.1772141356195;
        Thu, 26 Feb 2026 13:29:16 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666ed17sm2866703a34.27.2026.02.26.13.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 13:29:15 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: ath11k@lists.infradead.org, baochen.qiang@oss.qualcomm.com,
        jianhao.xu@seu.edu.cn, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
In-Reply-To: <20260130084451.110768-1-zilin@seu.edu.cn>
References: <20260130084451.110768-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v3] wifi: ath11k: fix memory leaks in beacon template
 setup
Message-Id: <177214135501.1298720.7382906918512740944.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 13:29:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: aQ_ijHtvtCGo4XR4CpCmzdMAS80H86yz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE5NiBTYWx0ZWRfX3zqSgEBuLFfg
 or3ASUeWGs46q+rkYGwclyKFsiNcEUdcNcSNv6d0jd+Sa9Jg0SOBERKO1RfIqGg/+JmXUTDO6Bj
 rgYa8MCwaoZVBuHwZ9/v80NR64W7+NVztKW8d8p/9ifYEEXNQ4ysqUUoWu+lQ15e+Uq6qBxBAA5
 WxAxwdBMk24mFOZ+R6UoPAp085GCHldONoo9/V/v9lsdpcz0IySefWGSrIeu1s9QlCSNo1r+44r
 bS2WPrMhIE68gmg9F1qPVZhGYBvMaTFRuggunLVL8jPSdTaQ3bZt/oX69arpY4+uESWySF40lw8
 Bb9AQHxGljeEtLfYfT1gXMxQ49nnejWgrefcNrzhyP9swUdqHZvaiaUGu05rCOlo5YC62d0Yg8Z
 GUtSF+1diOhs0ga8he54nF+HnlvbvDolS4Peh6EYgGhxMyjjVKPE7Ph+ghJ3gST4y1ai7ydpCft
 ROwYPH+7QyBdMzZ3zQQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a0bb2d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ej5cekVlhNKtRaV27UwA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: aQ_ijHtvtCGo4XR4CpCmzdMAS80H86yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132918_378746_75D045B3 
X-CRM114-Status: GOOD (  10.74  )
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


On Fri, 30 Jan 2026 08:44:51 +0000, Zilin Guan wrote:
> The functions ath11k_mac_setup_bcn_tmpl_ema() and
> ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
> but fail to free it when parameter setup returns an error.
> 
> Since beacon templates must be released during normal execution, they
> must also be released in the error handling paths to prevent memory
> leaks.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix memory leaks in beacon template setup
      commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


