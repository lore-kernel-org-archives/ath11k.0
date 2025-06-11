Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327CFC71134
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=; b=v4YEJ+w/p165Tr
	FpCfriAw0swWxrDyWjSKaiQPMsEe0/wqpRaQK78ruZNhXTkETMy3rZeDYIPU6qNsz+m9reEaVXFm3
	p0WfaN8H3RXp1E0NotIvB4SnKlF9QUpkkvNvOeExaXObqKnWR/tReAnIdQXzrTMS4EyOakGLX9RCt
	CT9dVPl51gsi4SDL54KgM5/8HQfKfzd6kjUiTDAEDpUW+y5Tuq3YVAUiKbEirSxI13mTKmN/IPV5q
	IEgHct+5b05YyfgLmL0Yx7NyQVcaiSWNdDa1jaGjo4tQ+bkZJ2ax/KdNJ9DWlHkmlP9tPDWlq9tUf
	0q1BbfcdmcEDj+TBjmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYN-0000000B4BV-30bh;
	Wed, 11 Jun 2025 19:56:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5S-0000000AZ7K-2uSy
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DO0E011156
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IzZh7++TWPnt7YAqqfAhzt
	YsaqI1nC4j1vdMdoyOJp4=; b=S9nwzEEnytmD5lsY3JIK/u2CxjjnuBzwa2Z4K+
	En/lXI5srBKNpC6TCq81bBvRIs2kl2iTorlABiOoBrB73JPxPRO8pQ2MMDXbZSdj
	/3pkzw0KNnMk80rSIpIoL/csMMouRrMWK42SGare5klQ7lMd0iMxuQskVp5JpJ3+
	quST39cipuIM/aldhh3TpSVaNg41pVuT4LY8zaftX4VNppysWhNUKaqCAuzAYWoH
	cZ0LX9sc52OrzgBBDa5dckOoW6alBlcfKTtSC+BrPlfShG3WoeMi5qL+PMuZd2Yk
	qJzzFl70vd6H16ZyCeDe9ahEZr+8wX3mE6PIcmVUTMk3pB0g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpw934-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74292762324so47938b3a.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658441; x=1750263241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=;
        b=jeaifWVgX0LEGEtUFmGpWhBf/jSC9gol/uFpzMBctI+10ETWGa/aYGR9uF3YYYo1t/
         CjMSO6cZIvi63O9pPru+DIz6IZw5q1iyVSaW8ZUo/aRXTF0wNOwS5DogYTMLCyh7iYlY
         DG2kgABO3uP6fYnONaqTdv4BXcfN1NtLdLccnOgQK/DXmszlH6OjDBPJXQjorAI37SBh
         ND9rd2XAAds7HwlGgPqXQosnlQwEgpH7vRhLd4RuaPfav/jZG2BXPs+haI7EmygrpTD5
         LF5aSix7Ly3YYBViRTMcigjPpTebqgxKxCV5J8uNd1oGXmkIl9KsTTNTrsGtEPcsot4T
         P/jg==
X-Forwarded-Encrypted: i=1; AJvYcCWmjb4pkILQUxaoHW0QzVkVkQDkz2v7IM8szUiuU5k+CmOd/UP1pyKiXmo0V/2dF3mOdRIWDss=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1vY4ve0DQ52M/hMszAatCBz8CWUwHil5EpLeJ2wq2qFGy5Jn5
	vx4fso+xQB1VaMcAmD5yTkYj2afhDDJIsx/GZ0acG6I+9wvIE8c5LzWS4wW8TIx5H8vSw8iSV08
	vggus/5zNfrruC42N+6nMoQ6NB1nXrlhU1d4W0pXGo75MAvxzodbcZpzyVAPAkqAg6NhB6C7e
X-Gm-Gg: ASbGnctZHB3hL1of0iSfsGdcaisnInL7VJ8sMjJFzREPiolFoFscF/XU3t6OEgjJYmR
	y0OotAoAD15WfxvifXbiUInMzJXTgU/IrydoFghBFgsqQs2Mj8uzoXCWN+vtlfpw0QxpwXJpK2D
	u5M+CicOR9edmwRxXru1uBaUSuZxfXa5wlmXujTMuO11byaPK4vRrGjWJZoCdxaeyzSbJGI4vMl
	3ueMPvdzQT9HSTJLNXtrMv6gsS/33FpnL2VuIgJJPUrwC9DNUTIHAoP68SyKhhCxbczzJZBNvdf
	BiAF7zG5ZqVSOVW7k/X+zT1Ivyiy4QsLlZ1qw9YSAWX0hP2CG3ls7sGfGFM=
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341548b3a.5.1749658440962;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6SRDJJ5564j6vwuGUZRBSXLBvt48Y+4pJb7MX/NqEakaLAuxT3fRBYYzZ/dhUftkuTCdKw==
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341521b3a.5.1749658440551;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath: Add missing includes of export.h
Date: Wed, 11 Jun 2025 09:13:53 -0700
Message-Id: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGrSWgC/32NQQ6CMBREr0L+2k/aIjS68h6GBbYfaSIt9heCI
 dzdygHcTDKZmTcbMEVHDNdig0iLYxd8NvJUgBk6/yR0NntQQtWikQK7NODsZyaLtE4hJrS9vNS
 NsvJRaci7KVLv1oN5h1/d05qgzcngOIX4Oc4WeeR/uItEgWToXFmtje7VLTCX77l7mTCOZRZo9
 33/Aq7uSK3DAAAA
X-Change-ID: 20250610-ath-unused-export-df19562d1b37
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6849ab4a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pn7C01q4hUtA5Nn5QkAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX9N7iXdNfX1MM
 AG2i1gNtKNHxodEW2jyKR38mb7v6RtGsyIeEJ4NTZqqn6o92fWHFbwvXl4p5/Bdqa1n+uJtNFAK
 nsPc2s9FQ6zsmWaWBDTDe7kpzhTVIEfGfDbeqWZxryRXYX3gORbS33s61wq/FuOp8GP1Nr3H+ah
 UvWZqBlgEkkbxn1GhUU7CxkZVUviKWwWMSyxmJ1jQdy7SMkT26Ff3icSfATdcwHLFdCQYf+OdUQ
 BlzC6xKp9Gz3oUz4a1lK9+pljhut4LGw9hPd4xNY6YjObL0EDX5ZgV4wL5IfNuVqlPAfFd8d56t
 R13JSZMOjDY+98jD4/BaFFOjJuMvsE9xjrtNeimrK8wYALa8yj/W927SZkXqqy/FLmFEkMla26r
 yzv5m1k5glNIX6w30RQsiYu0dd+kq+XcYp07V/Uwd4/COf2n255sFSUAH05bTtlqZpHU9RIq
X-Proofpoint-GUID: dLSbQonXSsbihESa02cFad0poc0QGfZ3
X-Proofpoint-ORIG-GUID: dLSbQonXSsbihESa02cFad0poc0QGfZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=645 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091402_754247_A846B705 
X-CRM114-Status: UNSURE (   9.20  )
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

commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") added a check which is now generating
warnings. Fix the ones in drivers/net/wireless/ath/...

---
Jeff Johnson (5):
      wifi: ath: Add missing include of export.h
      wifi: ath9k: Add missing include of export.h
      wifi: ath10k: Add missing include of export.h
      wifi: ath11k: Add missing include of export.h
      wifi: ath12k: Add missing include of export.h

 drivers/net/wireless/ath/ath10k/bmi.c            | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath10k/core.c           | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c            | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c         | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c         | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c            | 1 +
 drivers/net/wireless/ath/ath10k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath11k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath11k/core.c           | 2 ++
 drivers/net/wireless/ath/ath11k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath11k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c        | 2 ++
 drivers/net/wireless/ath/ath11k/dp.c             | 2 ++
 drivers/net/wireless/ath/ath11k/fw.c             | 2 ++
 drivers/net/wireless/ath/ath11k/hal.c            | 2 ++
 drivers/net/wireless/ath/ath11k/pcic.c           | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c            | 2 ++
 drivers/net/wireless/ath/ath11k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c           | 2 ++
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 drivers/net/wireless/ath/main.c                  | 1 +
 30 files changed, 53 insertions(+)
---
base-commit: 2b404d0c06adaeeebd355bd727ef600706b28197
change-id: 20250610-ath-unused-export-df19562d1b37


