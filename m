Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BF7C982ED
	for <ath11k@archiver.kernel.org>; Mon, 21 Sep 2026 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=; b=uJJA0MlCy3/sxSjyrtRvGh6r69
	WHvwWAQFAMTC7FMWum6psU9rNGusVlgpkwKWdJOIoEQr7rbtTLneWHHQttR+3DtgDq4A2H11sJbvv
	A1TasKkuAyvfENr5ru5yGy8EYOq0qlwvd1L6jv92JilhQYopgHiqH/4n5g40uOFD762yUSuoBpTdb
	efnk1ROvhLrNwvakqqwdGq6+7gQOvK+KdLvvOQyCuuPeImMGkNGKE03DhBP1v592CoKuW+P2aJXq3
	L5DerG2MD5ZrcfzCP3n2C4xZIM2upmOmooEv/TyrDx9cJYS33Oglzh4K1moIvdPvnReRzc8WMpLq8
	kDOAY9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jDX-00000003Bck-0pLd;
	Mon, 21 Sep 2026 18:58:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jDT-00000003BcA-3nES
	for ath11k@lists.infradead.org;
	Mon, 21 Sep 2026 18:58:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAaEl2163509
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 18:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uUXkYzIUsHG+2keQKojwyw
	n4Tl5BjL8Kz4nL3lPB3pM=; b=cjmgIUGCxQa56erxyQBavuIbHcWHKDZ+Gy4C55
	a2f/Te4QnMEcd+E9MIEYYLfZvirzvgJFbOeJCXprsFBiVRNsF0hkilpnwuxQrGrd
	JZGk6G/3WNEn8hY2HKYYoFqKa3g0aquIKeYjcSxPhx/CBx+UnaDh2KxBorO8e0jV
	B2X9QVjF6G9w7fsjb8ybyyV8ZI7yDW8UXEEZ1O54ubymAILozlqcbx2ArKnhWqR0
	RwYCOK2pY3pUavF0HlxZaPOx2sZz16PgeX1aSs7TKIPzb/ieQEdd0YK+kfmPiHFc
	QWaFrs5pcy/kIqLGGSr5JfmEGgeSejS2wkf1Ay6ZqG4DVK/g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw2w7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 18:58:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4412471a12.1
        for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017094; x=1790621894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=AgMZXkeKS3nCHRDuFTBLByw0fjQh6HP4vd0LB/rl0INbfvCEe29dCI2KOgjJZiAXU3
         wIsMAMIdM0Rza1rpRtwm8AG7wuUB1VwhIAdapzE68SXfSN3mBWyM4GXa7HAPFaf12msp
         YTWww/O/A0Kygmay2WnvXCB2jh0rt14BzkqkLqNQb3sUyq7BU/hfWZtx/sZ4Mc18soV0
         nywoWtiUr9bV+cBoYQw6Qid46mEJ4bYdzU89TskCCRR/f1dDTNnumIsjc9dk/s5qge6b
         xTKgpxiszR7NnvI3pW8/z2EDDaqbYZ7Ri9eraY6injT9apXjDDkVCmvpk4wMyjXf43Oa
         dkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017094; x=1790621894;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkYzIUsHG+2keQKojwywn4Tl5BjL8Kz4nL3lPB3pM=;
        b=12ZO5/NQIxx6TkQZ22Y1j1ioEqIc8AdD+VETKprxm0NMZp+IBFk3DewdrhzmfssacC
         krSu2JZVkprPxDDXlepyyUA7vEQEuH/vnoTsmNtFbMJIMNMfEVFQRkLx5ZIO2msj0RKQ
         7q4kCLWdCXd2aS8qh7Ti2EClnRQGfRU+LbQoEhgtI8dsCwOHovElaOfiL4Sl36vD7CUm
         /n9JoXW1eI/QIKo3sRilj6zJqGvaXU1GaH3tHh/78VOl7LN0yY8jEv8P5PetrRqppce1
         UtrNgNdZDKKbTYPaMV3hVmTomOHN9yfcEFSdvWGUimgrMtAiyatI+euiq6FndESfWp9A
         0mWw==
X-Forwarded-Encrypted: i=1; AKwUvBwb+IXfeP5fGpVjAFieXZnzad1Gm+iTptJTmmsjuTTN1hJHrqLC/2ahVRyb/W/2wJ3Sbhwri04=@lists.infradead.org
X-Gm-Message-State: AFuF++m9BrHvRPDPCYX9upBHveWygRz3akS4LmM68bB75UgaQHaznCh5
	DcTkyaP377V0zG5r2l4cF/rETtgy/H+kETS/lR2xl61o2z58G3+0zm9Nr0ZROEgxBPNmIMioQeu
	aY09g32oFWOSOp+Yq7lW0M1uEctGt3tPFKPsz5dhgXMS5Uf2CBP734VHkBq9YycTh
X-Gm-Gg: AYBFou0ZjpD3qlqBSLpNdVZDj2AdzeGMhop7uFN9EDC3OJc3ElbjPb4H+7N7TMoaQFb
	9DDBAKSmOI0uZOiNTlSRusEQjpIRuYM2cTdWihGFutoVkiGI7Jq5vcVvShOFeZuKQLYb5pKhHwP
	3N7bEWZJc0zJGJGHD+WZZxnveiE0+Bd+Ioa5YjuuiW25Rzu5Ywrp5RgOFKIBmruD4yGm1/ZgzLR
	yCOGYj13N116yQSYcPZdlR7XE20HGZiJfNcU1IKt8aC1/8qWRkOf3TXeppQY8RszWoTT+ITwhAO
	1No1U+/82293fYvHS4KkIOgy4TgP0UvAbzU4VahCKHNqrYMPtASqkXJXBTJBdCvlQjjGjhjqKc0
	Q478p2ZU+E31gH6hI2CL6fNu92knMsnlHyjo=
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267313637.40.1790017093687;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:482:b0:3dd:a006:559a with SMTP id adf61e73a8af0-3dda00655bcmr14267268637.40.1790017093097;
        Mon, 21 Sep 2026 11:58:13 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248fsm11523188c88.1.2026.09.21.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:58:12 -0700 (PDT)
Message-ID: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX9MAJC09COI/B
 TE0inlskn74bskdRNp/BNo8wQqEtOVdllJEP2f0Uj7ky/0ed9k2j5BIMkCfrjHFzuGSBgIjQFgc
 lAj2MCWNkndGgZX5TNoLHbRqtSOnbxQntG+o7ghC5d6B1oQnYLPU+NQfwUim57QGJ+FD0CJ5+8l
 7rz8xUyA61o15gLA/z8lR/1RMJ39bm85C7xP3WheF9h8vecExZZlG11xT5k9H1R4S/NmAXunWGu
 pdRLSk940/hzVRiwECrngyOsqTow17pwnKyZtqnuAw32ML25QxpXlAvNXpR85fH7oJ5cZt/lVRx
 lEHmZb8SZ+skNOKA2QywfEe/dtRF7WripeNyRqDPHvo8ILWXCv7J+xDZ0zNIk1WiLpsRCzZXWWg
 1TMR7avHYP0c+uCRbUdIeSTEmLfZuBMC5EiEv3w1DUVPjIgrYac03rX9+ieDqfzI/v9TycWbsQL
 P+0i3Tyv9/VF0AmGPbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX6y94nwIVDcOT
 EYqQCvuNaTMRpAx4oRKSs+hjW1QQ373L5ClQLx6BSClT67KGqkDcQFQ/CVt8Q3axarVrNbwvR1m
 g8BxEmcWD6W6U8bD7sDQP7Pl8cXsP0c=
X-Proofpoint-ORIG-GUID: bEX5W_ArLwHpGQ-vtJJVo-ntDDYxumUe
X-Proofpoint-GUID: bEX5W_ArLwHpGQ-vtJJVo-ntDDYxumUe
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab17e46 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=E4bmoj0mVIXTqPrLO-AA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115816_069502_B44F8285 
X-CRM114-Status: GOOD (  10.04  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there are two board updates:
QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5e0:

  Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260921

for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath12k: QCC2072 hw1.0: update board-2.bin
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

