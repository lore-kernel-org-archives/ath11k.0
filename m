Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C60CA1007
	for <ath11k@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=; b=JrDTaW3xjbX69DiJRYRkrW3fQI
	ovnFktFbekd9tiIRXxFaJCgbsXvbDKC2rGdYLyZTPJkGiXsOLufZhv9yb3lchozgm7jGCb+AN81pK
	K6laSVfc42RgNiJeeZc/1GNfjPB4T46jJNfazYu6cjSQprS/5tI1BBcXRDCCVIy+J5fG0lYJpRxpf
	6nBMfHkD9VnV8M/6ZTQGXpICt4DwO8kt3Pn3U2VXmDCTvSU0f016GuU1Y6dGPuKXHf8gBKt9OyoGk
	IcX0CGGDdoZ4Im4koXxEroqx/NlN6v5ojXPeU2mC29AuV9LaFWs/BQvL2GzRln+i6F4fgpANhtvWl
	xr0C42XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbf5-00000002uC6-0xG7;
	Wed, 03 Sep 2025 00:47:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbCG-00000002kJU-0zfC
	for ath11k@lists.infradead.org;
	Wed, 03 Sep 2025 00:17:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqX5c020050
	for <ath11k@lists.infradead.org>; Wed, 3 Sep 2025 00:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cTlL3s3wU08p/sYLbsbZNw
	CeQ/WfCrG0UOH18y1enxY=; b=Qw25cgHAnBYpc2vYAjDlzDvnXCGfa9sQcSorDj
	iyWVdZBQyPq92VAedW3V4p01QufZ4y/qYw9gnfBHAx3arm66gkKMe5xaVNlYM9ms
	nRrNnLIER/DpYNN5L8rcH6GBQ03pQXF3WQwmdRXZUtlFla98ePghyjIIGhOuxkq9
	Bx8fx9Ljn8/oNA6RR9NvWtyox83LHosH+uRR3otVCBTsugTDpRpkzh1on2n6mHky
	B34AgdwNZCAYAaSP5Bn6OYzvTxvB/F/Y0O7t4AFLZUqtwih4CPX7u3el3S0KaP02
	CcAAaPuhgK6UYazKptefvx1rGAWu7BWoB/9fD3cZ6MLtizpQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw01ns9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 03 Sep 2025 00:17:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471757d82fso4692209a12.3
        for <ath11k@lists.infradead.org>; Tue, 02 Sep 2025 17:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858674; x=1757463474;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=;
        b=Nf8ZAL80lulrDuViW5a3qL1UVBMBIlU922oHei++W3RDEpwLzAecns463OhDy0NEJ1
         foBE5RKKPwT4gza7sevIXPMzGElIJnP86pUILvmriu3E2MBbsr1/SynYKFKS+lphcQqW
         fRNCNH1qKdkH3tn300OXWFl64Rokkf2/j66FBR9UIlLQQOZ4znW66wHxB3kkVcARcHuL
         5VwO0JjvTlvc8W8Dh7aqfkINfGYlVvUmBecRc5a21kwoWInPpIB1pWaPk2LdxGQumE8L
         WF7myHVPN3H/7SmIFqld8bnrkBUHATMUb8kaWONg5WjIhBeA3TtTaFAaqj1mDP7Bg7H2
         ynKA==
X-Forwarded-Encrypted: i=1; AJvYcCXfncsFNHai+KQ36OQzU0oNUtez5ejHxuAUpNSddhsWO+7vtZwFjG3/7N/J1toK0olocUuanz8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc/3Rme0UQ9oNV3jdjIN/Bl+NBte0lt2InrXX1M+A29761+Q5C
	rYv4vwEDEs8pxhjYkq4+x8Vv6QS8r2wVuQQ9DPiNbHd3RtYS1dj+zLB45hd5c5GYYNb1DK0QX1F
	zlnBZcyPA1B7LRIddbqUjb5cq+ebWohni77wvOn8eioRaxhT16bX7dYD+Kqhc34Obs/TE2Jbk
X-Gm-Gg: ASbGncvpy3Xr60htrSjGzO6/1GowpRzjtYryBlv+udZed7GcUcPGbknQyoOCyLhUHmq
	ng8nfKeHjn01dugu5AmnPZgy9APfotGZFe0o000VtCrc4FdMt3x8bG8UFjpkiX6P4/gAPxmieYJ
	OZqKSB/la9n99QrYnH3i88jpQr3SAp5G6juGkhnZxKRdPF4lZd7JXIYq34r+UDuihPdZXUOClsr
	G15Qe0BpQurpuORS6dQBUXcwwqwdKFc5cX6z60p2gUzDWVlLKHMabb1y7abk5S6TKEYGftIcnSt
	WjdwMfcm0xvb71oILayQwryLgVBY0b6Id964ybZeuHPYHPbyt6bLfJq7sQ9yYuUKod/rD5W2Pnh
	x
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232372637.37.1756858673670;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoBDXowFfmFVh9kvrykyPsnoguSqtBdlEPxuL91LPUOIVWBRu7O6kvVYOnwcBKK7zunER1w==
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232345637.37.1756858673229;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772466e629asm10148491b3a.31.2025.09.02.17.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:17:52 -0700 (PDT)
Message-ID: <8fb26b97-f483-4155-af6b-493b2bd16442@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 17:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250902
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xcV4-OqH6B9eYdOx0NmlbyEAz7G8K-Pn
X-Proofpoint-ORIG-GUID: xcV4-OqH6B9eYdOx0NmlbyEAz7G8K-Pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+eOt1b2qvpFs
 s/3tvVtaeEMFkmcWn69AD927+vmTgQMH2rfLTvKCTSvVcbJwkllCj+nrABWLgvMwDFS8aZdJ5rF
 2MyWJ4hmC/OxAqwo4oyMxfeeLU1meU3CgcrtFJDMXVD15qehO7Sk0d0Y51UnskXfRsMSJwM+Cq7
 EcPC4VBu/JXtsn30FbPQ6ANYGcFT8DEBYGEqNdjqPcgo6m6nOzX4VH1gJfhpgcW5swjCrQCGvE5
 gneA56n+Y8nSuOLIft3KidGkPyGSiFO6RokJan0NtsmuBBpsHdXcJGzZHyyZp+Jezx7vGUfqSID
 PiyphWIoGt6+t5B5nZVfU2Tb1PBVnct98oY2KVCOG64tK/4VfFL3ldUwRdBGwxiTShXfR0ppIhg
 mlD9eZsM
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b78933 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ETpNzpHT8A4ojKDL548A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_171756_400071_51FD511D 
X-CRM114-Status: UNSURE (   9.53  )
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

The following changes since commit 2c72c8d356db40178be558bbbd43a1d0b5bd0c27:

  Merge tag 'iwlwifi-fixes-2025-08-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2025-08-28 14:03:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250902

for you to fetch changes up to 97acb0259cc9cbfbd7ab689e25684f3d8ce10e26:

  wifi: ath11k: fix group data packet drops during rekey (2025-09-02 15:43:16 -0700)

----------------------------------------------------------------
ath.git update for v6.17-rc5

Fix a long-standing issue with ath11k dropping group data packets
during GTK rekey, and fix an omission in the ath12k multi-link EMLSR
support introduced in v6.16.

----------------------------------------------------------------
Rameshkumar Sundaram (1):
      wifi: ath11k: fix group data packet drops during rekey

Ramya Gnanasekar (1):
      wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 111 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |   1 +
 3 files changed, 105 insertions(+), 9 deletions(-)

