Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A22ED1266A
	for <ath11k@archiver.kernel.org>; Tue,  2 Dec 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=; b=dgbVM5ZeZ25bvIwx9qCsol67Ml
	Uc848znq+H0+n3dG2lNhR101H2Fr1uMwvfTf9gSb+we1kYd6wNIuFk+eCh5HrdnxRmwBjPgnBQ6Qo
	z70socrDHKTeOduqbqO0IkXMbneB16/D0YIN9SgxkMFv+k3W9oePb3O52Tvo4QzIXQ/LELlxRDtTe
	AOwotuGQGTQqr5ueHLGXsnovS8aSnjapSGnMdrEAbtsp2kPgZn7nJM3YR68e4bSjVn+FQvOv9BADu
	TPWPZksD2Gv53gvQmWVkG+vCi5NRWkmLH5fiO167oiYvyaST7XFx5jVzUZrz2WhU1WfMgLnmCc8X1
	FBpjNPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWET-00000005lXx-1PHg;
	Tue, 02 Dec 2025 19:40:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWEP-00000005lWU-0Q80
	for ath11k@lists.infradead.org;
	Tue, 02 Dec 2025 19:40:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Ik7Hf3242729
	for <ath11k@lists.infradead.org>; Tue, 2 Dec 2025 19:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ymqUFuKgkW+1ZVITaHJuQJuC
	RC41Z8npiwRYSjupMVQ=; b=GAAOUGu1pnU7oMhHYLNJ8fln9vIgFPletMAjmeHX
	QbhEfK3hCHGC8rM8nd1noR6GdRmnjM+Lvg4Mbtw8UOHbCMid4PhWIKaiaAord7Xe
	Nx0e/3SGxVgyrld0Us8Fk6MHaoJJ+HRbosFLlbx9kiXPVwuAxiK2R3YKiNcoXcbg
	LhGShHpD7CKJEMu4ERU7Yw+lSo1DkdXtCyu7FKHm6zJv8DFo+L98V8Di8LWTmGEP
	6nCy5AL/ZlBCrpgqaM5tB4hg3Ub+2FY+bMFCVignQJ+lgEFda5zmOE3WSVvKgPDh
	GhWzeyWT/TcdIm71ABLZd7MbwyoxxFHcYwU2YrBUmF76Bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aswh51wuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 19:40:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2657cfcdaso671713585a.3
        for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764704410; x=1765309210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=ekZp69POjluadBd8fsgLdZK3oxaDQHVS/pKmWKWf42ihnMWbCy1PV10tgZFEzPWpFX
         s4HFLh9ceUCsdBy+RAngYA43q1HpaMnULOmGYiHcpd46/sUDf6cNld2BhXXOSn6/D8tk
         TeOKFVjt3Xdz2ZY+oxz3myMQ+SMpBNOxVxycNBSvjQSOO0VFilskunRIiKw1XdOkRhmV
         q/GNXrQkNkrWAy+1IjpFEWNKWvups0TBiiCSEVweSt5/O+gghKIlCKtKehJRagOsnuYX
         CxBGBEsft23OnB/fCLHXg8pLpAREmFlEKmAoLLO5jzOKdaxT4QFEn5jywLqUzWYYWOGv
         p/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704410; x=1765309210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=LphIb+oplyOo5T/QsZa3EEa2E18JXSrBBgGFcNxxiz1dMbhsMVPdm1UkiFOCt24Mdw
         pbKDiOQj3ZP872MWpYnCaxIPLhie7rd/NcYPm3TzZ8Opp3tJnWpgX4A69IG1Qec8OxzH
         PK3zSyrD+OWqN3tkIOjcTa4RhPj/RCsBlmIo5XQGgyVxcJSghVp2A+YtO6J5zDBiQe5L
         2d7Nw5zWs+uM1nTdQ41sgGKUXTRF6Z7zmx4W7CbqTF5uVOhLX75x/FcZDO1l077+w7CI
         wg59t64IvdeFUUkzlGIsNx36unH4fIKY31cjLqEA1qhLseFvxrhj7tnB6w3sDyqYJGBZ
         EK0w==
X-Forwarded-Encrypted: i=1; AJvYcCWoXxGqhkn+mKnDD/RVrm059WVq2PQyRK2M+tjRrVY0EMAKsbmh85mjTCby0SXdwbO26qdTRFg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/opry03u/h4zAWXrLg1+p0EprWxui4oI6WUWuQLzrmJ+iwhTi
	uP57dvYwhp1GuTSYcTdlo1EIuKtK86/DnlQZNapWuvktEzkBR+3vqtt/+/1G0jnvsw1I9J15xQ4
	6wkOJITUAMw69RNK4QVmR6rfkoYiyJWYPd6OO20GXO0vlhi2Hwj+KzT7TBYYfILo1
X-Gm-Gg: ASbGncuqPgzZpzeEF0HpdYHIP19die901YdfGIkzAH2esFyphDDyHsXPG+c6rHpfUpo
	FOw3ksq3FyIb1FTQ2572rr/sMdggf2bjK9mJ2Xlcynt7siCMq37YqD2l0/qh5fCfF80jrLs7DHG
	1bEe79DuvQLZHLIYOk6XYRz0MYpU/GV+RIXpsCAfnlCsP4mVnSZ2IJNeUdQFd3owbnxZM1zalYG
	eVfpKSPkLMOp9oq3lvIedA9fOART9EEO6Nke7+DKwfY7xV1nWe54UEJ9ZzW9pzvv7Glwp5PrwmP
	ZPoIN8RPeMQFvVHBD53qNZUNO8g2bkKAi/vKyFZ6kQwfoEG+ig9gLK7wo4G4yRVip/pwkNzbdL3
	s8nm+9I7d865VZYoI7N4bKMtjAcxH15UiGIVxEvujZsa+IFaC451mg6JUCTm7XsiuSRPVoge69n
	iV2Zj64qw5dx+3RRi537HPlhY=
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219786985a.6.1764704410171;
        Tue, 02 Dec 2025 11:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeduTZfiwuLmEI3ux3Yzeal23XZK+cH0bfIgKG8RjjcKOtbLOA0MsLVdr+HitBOBcoOQR5QA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219781785a.6.1764704409657;
        Tue, 02 Dec 2025 11:40:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7d0asm4967858e87.11.2025.12.02.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 11:40:08 -0800 (PST)
Date: Tue, 2 Dec 2025 21:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251202
Message-ID: <xznwi36wauarz32zf6fzxug5fxpu2dd2de4mgnwoxbwkyanjfr@f4fwq6jtxuyr>
References: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VNzQXtPX c=1 sm=1 tr=0 ts=692f409a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=9XiVC44GTZ18DIIRa0kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Qzxk2f1pD4LG9rG-PnEiqq3Mcz2pEczM
X-Proofpoint-GUID: Qzxk2f1pD4LG9rG-PnEiqq3Mcz2pEczM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE1NCBTYWx0ZWRfX1/VXdWIdGq5e
 XoAzQJeq9o3ds0gUAWvMKTo9NWFgGqQ03D99uIlByTB+vq39zvtODYKIruTkkCslxDboQptyvk/
 Uv6JPes7k5djdyS1ot/rqeep+L1YkCbNW2gGrpIyX97eljGa3xXEk/BGQC96bryDtl1g9Esn/bD
 0932TBuUOEYBNifmO91OcRs0ba08lGcst/iK8ifYnvukziQOjlhmAID9MVrV0ROMnSQimzcGV3x
 ox3Y+vQLYU/8Xpf9bEmHZdVZHW1CdeWqJjhaChsHwUzINGp3nMAFmJJOJm+Le+eXKZc2ueLSGdK
 lh0wklOkvP3g4gBK8TauA4CqgFRk8WxdhHLw9lN4y0Z6e9Lx3O1mNiazqxbeezUeYCRx1CsSZJ5
 2NpJshn3jyu4ngfkga2xHgFzeLIFww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_114013_249324_5702048C 
X-CRM114-Status: GOOD (  21.19  )
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

On Tue, Dec 02, 2025 at 10:05:38AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath11k is included this cycle.
> 
> Update the board file for two QCA2066 platforms, and update the firmware for
> QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/814

> 
> Thanks,
> /jeff
> 
> 
> The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:
> 
>   Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202
> 
> for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:
> 
>   ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
>  WHENCE                           |   2 +-
>  ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
>  ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

