Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4EFFF6E7F
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=; b=ruG2pxM8IWe50fcEHY0c3AwbmE
	uxXUtZ4QhK0uZ+Gq2K8OGlnr5Dk9zh7lm4bH0Ce5O119cI0n2/jVbPAwiBZKiePBKOJ00AzttF+h8
	EIPLhb8bEatesUyJQpxgHtf4SseqBffmKZgF4ypUjP6acOC+YNdroVI8k2zjmeRFTBhxFOQNPYmJ6
	G7DiOs8Kmqu0L3b630jbQxU53BXQjtoLx8mBk88EwmLixWPRxH3szLkxhd8GaftqnDj7JDAU20cr/
	fipDiGK1avny4+HFKC//9r/LZ85MqNOHhHpiOxmQomIn5aQDWFPk8ffjkeqxWpfTcTzkZwDKtgF98
	95p6RbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUV-00000007DhU-3lqm;
	Tue, 17 Mar 2026 20:58:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bUS-00000007Dfy-1XzA
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 20:58:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJECH1632241
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13JEGb7aTnX7IY7HCWv/idnN
	4TiZVfefOdq8xjCIpRA=; b=PbX4K2Bqg4rwv9YhBy6BCIkis1123gnDwv1ZUynk
	avZ4xOdADkyRER5OZ6i4XUeUqV+BvuIyEchK9dODrt50fnytLyRlmcEV6Ku22Tka
	QWu7KKQJH0hd+CnHIoMSSPRfBBQBSUNni4UK+WcU77OT+gb7vV8s30S+ZzpGuSAP
	R9IDtHPsRJwHDGT7ZvVtQgXOqDPlR9RkjVrU3KQupUBuDOKFeqbKJnR/EEZZetJ4
	jENqq3vrgpgdTCfDTsmhYoiyJd8GlJi+G5KU+YaUuDL0wkOEjdEw6hF3CcYbogq/
	+8/M2tQPoOEDoEnGclSKd5CXB+zk4SaG7Jn5wL7GnX2R7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapugxyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 20:58:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso179058985a.3
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773781089; x=1774385889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=KTPzG5wPvEKjDA3QNayVahrInST0lkIFiNFklwAG/FUxq/8FDn+XluEGBZpF5bdC0g
         huwoKWUlqktY67cWYEBA3rg3MkI0zrY2wcjNIs4T37HS86F1u582KNT6PBQn5S0GS7Ik
         zczqI67sCmOY+5lfMfWN+8fo3m0TjYqszYzIaXre2OGcHzoj4i275Zr5+hJd268qElRy
         XuS7VZ7PD/M4xhH/jTYZGH8A2gTg+UFItQ8TxOPQKBdI70z/JvphRgt2R7DEp0pbeMab
         TR+Kc30zvobp9joxHY7sEvojMCW6ZdXqmDKMzT15Kqd4o8qqY4vSUpNlkB1Oqp0lQGeU
         JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781089; x=1774385889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13JEGb7aTnX7IY7HCWv/idnN4TiZVfefOdq8xjCIpRA=;
        b=Nw0tqNJBuMHi+4BFMls4xVtz5FcC7jOol6gi+hfnr4DTkQrHnieOdgd9coGOq4caXJ
         MNCwahvZIioDhYWqMx/t9Icz+DfUS/P0VuB6boFkGUx5UOi2kr7AFiQWCYa1zqWYP9Od
         wI7CL4FOoYd0Q+45IgznsMZTh4RTNx9WHZD96MLtDGY1LloM6L0S0rz5J06UuEwIUD8w
         S7A68G1jH8RpIhfHoDPODJ5LZ7sjdRBQWiEegBr5G+yf6ppEPP5BgZxv2DEWUbENALgU
         WaLVmAhNSo2NMipS6w+0M5s5bGm3ERxQIbxTRgvGzftq7aRCurY6D7T5YH316KXrAA41
         logg==
X-Forwarded-Encrypted: i=1; AJvYcCX3FuKAyby7Z0HSACLWHVHw9w0H8I0ybNuOGVsiVx/NK786P+Pmoiz05qsRrSo5/kAqXZI6AN4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKdO9Jz3gyYX8V8eGg1+emy3dPM4LFI58ATv2syS8SAEx/dY3n
	CzqoNye6UDL8YggGuYeeE2yjkdoQJZuRh/6doKbH7hehafrCCp5HIzMr7TjO/4RpuD1Q/TPweeL
	Ci2sUYaRLnVDSSc2h/XC9c/ryi0MOB++Aj3qf60MxEmf4Zg/Dpn/zbzRP8WCiW0hR
X-Gm-Gg: ATEYQzzmzBPNWVdhy9I9n4CsWWjnZQFP/afKTkwRQKHlblqoaKe93/z7NEK+r9MlBGg
	CqdexwXOApfdbY/llPNGjPkjCZ85eQh5avlvfHPSTsq2oIPYi2hCBqrzkJW0rFsYk03mWwHHZaS
	QClImc4XogEyLwugQjzBLDP+vZiFNf3ehQu54K2Vg4m+ARb43zLpMAPmw1fSP4w+pDlrvKAT22k
	vsVqlz6Gxl9HBzSisYk4N0hBw2QLPhkrUTAAEOzMNXGadqQC366iQBhE1TfhstpgvhDaSUlUQTw
	Ou5eTuLSTTPCLqwPsTw2mCX0PnViWG0ES0pIvxSklb2hexRRaeFQQfvlBBoLTDljcS0FNDpyQqV
	I2xpzwuZ+VAbQa/JtWe8mmlA9DJUVTbOG8lsQ8PTyIQakndwWSPoH/eshwozh1/WtYCso5PTPXQ
	9EHD/z2+FwxP3yAQ2mIKuLUiTVZhIVNW1UXeA=
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161538785a.21.1773781089335;
        Tue, 17 Mar 2026 13:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:7016:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cfad24abb6mr161534685a.21.1773781088780;
        Tue, 17 Mar 2026 13:58:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7c77fsm101863e87.81.2026.03.17.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:58:06 -0700 (PDT)
Date: Tue, 17 Mar 2026 22:58:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
Message-ID: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69b9c062 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=5Y3Z_7dTJYxM88ERm3YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NCBTYWx0ZWRfX8xE5C23ZmZq7
 /YarDkY1Szf15l+Iyj94pib9SiG7NlqK0zZlhBfjh0m9Wpt96FwzP5+PNwDin4DYyqpbWtbSbSz
 aB55Z2Nawp5MkNws+98sEWaZ/LeXLrbeM9p6mS6zdltR8wa2Kib4lwKzpPFIQx0/OCBfs9yQxQj
 uBPy3f5ZFaxQZBokotkKnttPOvJ/OmBAZz7lKjjjWdd4b/VLruQzZ2IMs/lARwhQ1OqaqkaNHT3
 kspcHvyNmFXpre09GcU7Sbuf0uKsQnLKRaiRp6sfY1CCll+epRavTXlsXF7ZKlPHvhJ94hUSh3K
 dfTeF9AEOOBTP4m1UrCXZZaB3+UblvVkT4AvNaM4CPFzIoUX8jmcKZAMjHlE7rpm4C+If1sI+Pd
 j9CH+XEvRu9+Ps6nm6rGaHBfCJ0EWm9D50v0aZ56vvR0UfpJTYWPeVnmsqi74lySJJVAEUHHdq9
 8jVKADWGYQpp2PTfnnA==
X-Proofpoint-GUID: aqg04qzcEhMMlfl9uf2l2ivoGX3vryvx
X-Proofpoint-ORIG-GUID: aqg04qzcEhMMlfl9uf2l2ivoGX3vryvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_135812_520481_CC35852C 
X-CRM114-Status: GOOD (  19.75  )
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

On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
> 
>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
> 
> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
> 
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
> 
> ----------------------------------------------------------------
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath11k
> 
> For ath12k:
> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
> and Automotive.

Thanks, updated and pushed out.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962

In future, could you please include similar information into the commit
message too?

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
>  WHENCE                        |   2 +-
>  ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
>  ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

