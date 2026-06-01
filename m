Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C3CD6E4C
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GewhgQOsTKD6IeTpbfegwOqTd0TkgJjwShQlC2DMXKc=; b=EfO1Bs/hHL4mN+TcvkQyqJ/wG7
	/oKes3CFjUNC6sC2tIB8S4z9JlUqltOLqGQRScmiX+iHwb1jt5HczaxDxQIAiXfI+p4tQbkCvhmHS
	1OaVFJ03WeU2kurf2l8QjGpOOScAA7Fa8dPCvcGqS733/0+W/T5/jz6IeE1/7kzA1TVW7SxqiWCcY
	X6DyBHFT4o+dPT/JJXoDUac3kyPd7UNH9S8WaBvzUn3JWtuVHTnGmoocsbDlBeMtE3PHgsI2X9Pbv
	+/LTi9jcBhn1wm3dq+K1fn6YiATj9eT8q+am3JaH1aT+0QhdsnIaOC0zbVrfIvQW7ZeLXwhHopbgH
	nr9nJpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtdI-0000000A6Qi-1IHu;
	Mon, 01 Jun 2026 03:48:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtdF-0000000A6Pt-0fZl
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 03:48:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6512PAMQ1012189
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 03:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GewhgQOsTKD6IeTpbfegwOqTd0TkgJjwShQlC2DMXKc=; b=ghWtBNoSIfX2hhm5
	+SUz46w/qSt727+26XkJNz1YmCtkCH7dd0gXEGpDvC0/7LwLcVlU1DJUaIme8p3u
	AOxJR4bFZoXHoMfrfFdudY/b191qDHXbCz20UYdgkv5/8KfnHefF8QnyUaLrAURY
	1+IEjurIIykmqyjHv1zrczColKii1mG7iugEnE6Rc4uYyCrz7Tgmu0RCJTq+qx5y
	9BJXZgqQ7smqK9Ezq38Ff4KIyg8OkDSVwpCSIQ5/nfDSPUF+d096E44sq2qqkpZw
	+QDymR65XESDhEZwV7kHWq3VFqVxHEyVOEh2F/Xh16n4/S/wioJO5dbG4F3KTFGw
	+Uzu2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98deca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 03:48:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so1984913a91.0
        for <ath11k@lists.infradead.org>; Sun, 31 May 2026 20:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780285683; x=1780890483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GewhgQOsTKD6IeTpbfegwOqTd0TkgJjwShQlC2DMXKc=;
        b=XvmEdZFxdoYwfLdTdjFL0gG3Ou3+BRI9UDO85MSlJ6xb59HyCoG8GDprNQ9Sm9l8ye
         eaKVbWnfQbcg3FcId8RqhP1W5/hmksYd6yb65SwYj0e8oGUOVNz9W4Ne2kMC6yIrhKmP
         HuRtYIes66d/VubdxAb1uM9qo6nq+tMwE71Ow3PIYNPzbpOiNZ+gffNGnLeBzurp3F1+
         KbQm0knBfl0iFCfyCp67n5szaMH7Cq1QHdoMMAiKrF6iZFTZZRJTpOkWppGT0WET4zoN
         us213KihNjCjL/8Zo6jalfQFShIjw/VQz4tlIXGL90u4IfLVxyNie6Six8kWilf4g8LH
         j2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780285683; x=1780890483;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GewhgQOsTKD6IeTpbfegwOqTd0TkgJjwShQlC2DMXKc=;
        b=stERMqeheufvj8IIzwV+OP76qvYlH4PbhraMWZDrLvS+qN0SfMWQcSjcym8N4LK9cA
         FYnYTiA0T4GyQrlsz021/N6f0FYicHi6Qfom5IfycHrygUPvcMqXZgdO56hohRvfC/wU
         MUlkdlgdR0IrZ3t4x61vdhaTlKnkCBeX+oAQIbXz/pE1VkhizGS3MGwVz8JCMJ4n30lW
         mLaC8ddciw3L+IAuoojDlFw9ljAm1O6+occCMy8RQlRjw5G7Oc2AP9R4ae0XorppyVND
         SrpfXMdR8LR0gjJaY0Pkb8T+8BSLDuI7alR2i+51SUzhOT1C2FRXOvsbMCPjWU7orXnv
         h4sg==
X-Gm-Message-State: AOJu0Yzy7Ctoc9VzNHg/vyKIUJhVzVwVyzWUTSboIUhpYYvbq4D2gZ7f
	+z0BEJLMN9sW+gDxsGLw5dCkmsme65ppA7ELm4JdMkKhS3CZBNrHKrft6tEDvnCRfWpZBipP5ye
	mpOewATpZsWlxawOCh3WY/C1qbLWEPGrRo6eHiuSOgLlPyQ3dHtlLofDHobOxERB2
X-Gm-Gg: Acq92OF9+81yP/nwWpeNJMIjSJTje1EPGGUHBnoVs+w8w+hRi6ibpcA0sRJpcCATR2c
	nxzcfURINTL7/qNK2xWREdncihdhz/YfvDgBRtOOzaVv7WPQhwmvIZVgTP3VwODrpzzLZ7nwZ0z
	vImVqOIioY+MrVrcAQwPtXAkibbFHTRq0I/rXs3L4Xd2Kzho4Y2OpjgAyUQxaI0gOmRIF3F6h3s
	U2J1w9H8ueFyWbl8cqX0vGAXPe6MfwyYRCcBufliwkXVNDcQVXTHTk/+IAFcLxqbouxoo64Sp6A
	YBHMKjl76ukaL5Z3ACsuAR4tMGx2Hrz5rqto8ohzMkv8r8OEDL87NZZ+MhzOc1bUu1SV8o4lU/L
	j8nNccAuNYgRwAD+9qFMZvwYu1tX/pdx7VoJilYPwWEWA68Oii4ivkweNc+grQWQ65L3gt3MJdh
	/fIF/XuDL/uEBj/l9hwKeUMpdT485f
X-Received: by 2002:a17:90b:2ec7:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36c4fefbc68mr8435914a91.4.1780285683139;
        Sun, 31 May 2026 20:48:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec7:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36c4fefbc68mr8435885a91.4.1780285682670;
        Sun, 31 May 2026 20:48:02 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771d367esm8218586a12.11.2026.05.31.20.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:48:02 -0700 (PDT)
Message-ID: <83065a6c-21ee-4e69-bbda-b499caa0b6ea@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: dp rx sanity checks for
 invalid length in error paths
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d00f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tUsMSZr-IjeWTF3pStMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: okrmLgGyJXutEYAt3MFrNitQ_Tsixnlq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzNSBTYWx0ZWRfX2If37cyICaku
 amj8vkxJ4wu4VQSsBgOysoYR7iv3hcszvUm0LzosQdzlwi0Uhb0v/le3vfdhEt3YnZhV+CNzPYS
 sy4bB4CvfuDBiXF42DHSHx6qi9GewXv+Kdke+3Iywo9kupwi07zqCdskJOCGpyjvx0U0KQt8821
 kLV11Y/vptWcxXNFMDCW5unzz8xUygjdgIDG13bUgfQo9WKE2YMwQVuTr0LZqU5z3nOrBrnLaaf
 lcDKd7lusanP4gqczR9dgE5U7msPrCR9BvMwn8FICrC5e0fYkvlB+bpZItDJi8EL9gyDtTmMOrf
 zjZuDAt8jp2XhaGfYsy+suXaFMSaU62cxFp0jIMG/gCdFlu+7ko6eO2kcNoSdPwoUU6o9CS0lX5
 mm2IDiU+QSiy0u7GZgTxel7RsYEUr8d/Hc+9FWZAhvhUaRXkVn7s0QLp8od9Muxoxj/QhpaOcCz
 sE5OgUI2mZQrJq3v7VQ==
X-Proofpoint-ORIG-GUID: okrmLgGyJXutEYAt3MFrNitQ_Tsixnlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_204805_319062_617EA153 
X-CRM114-Status: GOOD (  11.82  )
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



On 5/12/2026 10:23 AM, Miaoqing Pan wrote:
> This patch series adds two defensive sanity checks in ath11k DP RX
> handling to prevent invalid memory access when hardware/descriptor
> contents are unexpected, especially in WBM error scenarios.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
> Miaoqing Pan (2):
>   wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
>   wifi: ath11k: add MSDU length validation for TKIP MIC error
> 
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 59 +++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d

only nit in patch 1/2, so

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


