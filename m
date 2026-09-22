Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73625C982FD
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 01:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=; b=UaC2F1F6OYBpmy70DIcuuKbRVy
	KGqobvTfpNP5E8EpIvXuPnds0RoRwmh38f8oXf7WQdNYRgMwu9OZT8jU49H+JvYSvjjlJNmOY4sNN
	Va94qZfktLwZhDnE+xgPx8AYzHrD6KwkeGAjyXFxfbooZGTK5eQS3b3Tj02Arcs1GsQl4IdKtwz1W
	bh1U6ahDtNHcO2omZfGhX+w6t62s19s9O8IqUuUZJ39p7Wuw7gZHSUob81JtA+wdg+U+qGm1KWGDq
	4nhv0kTyxFnQW0QEpkNUY0AjDPeED0fOKhjRMFDUBGzCQtmlAyN/YoNdh3upkZrmZUh4F9ByOBsGz
	hU6ACDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pG6-00000003su6-3WdB;
	Tue, 22 Sep 2026 01:25:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pG3-00000003st6-0Znu
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 01:25:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00NWB3306498
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v66LYWtKI8kl0sQYCAEnWh
	cI4TUzobxM+G7V+VWy7YA=; b=IfZgR2ujMWGQcEz/UR6Zju4tHgRvaYK9eBrWXF
	oHAMfFV0V5DSpCNoka8lw+n99HXDBDL7Yp56o1ynk92YQ2kUZceFTsXONB9T303v
	pTWsuZ1H515EL+ZYW2M4JF+SmKHGLnMB7h/js0OYKqvF7n1i2yErUEKd866tC9zJ
	3fxgaL5sOWUqIJgZviyNCr6fXLmlnFTxjfHWseIYmflxFdaheziu7SsMbT2MNu0S
	GipnThY+3kT5wxatjNFwKUi/QvgbXuXAyQYvvzrix6TJeUVDVUk/dM97v2QJeMtq
	R0Td3CZXjcLyxR/JXGHO5WUMUCB+lPxMK5v3gLRpcuQ8vxNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw44ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2817377a12.0
        for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790040317; x=1790645117; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=RonEnZFP4PFq0ggkiJdTm4lgScUE6Z5DKhuOI8Te+JzGbhY0tUueDXd+IRmq6DCpFp
         J8+XsHYE2ud0T1iPo131NyAwhEMp7bW+r/IeXLJmKEG4/xQOvwHss+3G6iBNNkPSNFpW
         babS5A5j9s4JkRXxnZnafWP3jXep9WrvOj2imvMWzfLFgD32rbKP3m5iYGwvT57508uH
         QdF2R9ZZSfhuxripKp4in4q3Moxx9d6KdmR1Q7Vu158d/kVZPcE2tTnIer/3OuCQNszG
         VnDlLdMHfIrzpMgE5k3Vg0QYKNwKtIGaeg2qMZYef+S3rF9PzhCj1DsZ4pCaSvLCNXB1
         fstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040317; x=1790645117;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=fzjzLlCe3XiqTfgqMknuZrHD+MVVgRxotMeDjHMMK4uYb3gmAqUJW12gr9/yzPSxTn
         nHBJrs3zD8RPBxO3iA0jocAulXvf0HoNSqFCCvT/k2HH8lnt2nPkRyKvZA9styxTDky6
         +9834fwCU2qcFZxoLWbJqYNm1q6OsWcrKmlC8HZaFa44er/uny5u99tVskh03jmEuNBL
         BCeECUf4mSGxyZQmcO3b9ZDdLTIJHmJ2l7TpFdBlUEh1ZETI2wTB9LaflmbQ4Y9RLc6D
         HuqAmVZqgg5mREs/4NzaA8J/0TxQnhAKU4EtJZwGFzQczmHHWcbxiVxrfxnH8ITv72ap
         gh0g==
X-Forwarded-Encrypted: i=1; AKwUvBxIaMS6NXsg3tshO90/D4APHNMq7t/SPiiJbjTc0hUJHxBvPhNtAsbipaDmrmCzY+ymYzsmuvM=@lists.infradead.org
X-Gm-Message-State: AFuF++l671tgT9p/Vc2icdbkdMXd+6U3+NiL1n0dZSCb3LFIFKk8sFAT
	kN7HzyiDGW/dQ+0DzTcMwvgjMEKZwm68LDem+zV8osxJ8IaXvlmfurPB7bu7IiR4YvQYxk7D2t+
	YIKkwQocpNHIP6BqNKpQ5hB2wclKbT2c7MXQCXkeGDbT9Pc2itJBOMyze8x3t/Q7e
X-Gm-Gg: AYBFou3dAhhtfyJhIS2nR8yEds79z03bmMhAVhJnRJWve4mHbJCXE/MXFEuegHcs9hC
	jGu2d4DsHgUXFoOEL0bPdllDU7Z8nx5KLiuGtPeD4tk5sD25vblejj9shSt2ShRhvQhJnKAgpdz
	Xm9S56q9qoZJXPyamQEdz0wP3gFJokf0naYyDIQd1CWpmFw51HP6Wn9t6ORV5jSrUGkpapzU20Y
	P7IV+I0f9TRKe5gy7INqou1t65cftkQiUBIH+YYhK3nv/ITzXqngy+UAWqNSTv1rZSJQbwcs8cY
	sgI9kZQI7YWyNF+F8ckRZUFzrFsn6/JbCdEvUpr7R5ySGY2A1QxPNhXOOs8B2NWIu1Q/FAbwII/
	qV0iC93uXpaapQEFg9uG2SuU2qhUVuXvhvdo=
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360144637.6.1790040317016;
        Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360124637.6.1790040316540;
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm781214eec.22.2026.09.21.18.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Message-ID: <e142b46e-4cfd-4531-8611-717612e329af@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfX6NDUpjbun2mM
 SOxNe8w1ASTD7+IDe+WCCjPPq8KzxiGlKG9IqBNbJswWJpww852EPRFg585osiL+/m3+52EOfmG
 0bue9EBoKCH1Ir1pUsOdethd0U7x0CNLLU2Ad7O+XC9HdUx7Xa25vItyoi4wS2L6syc7a3+TCNJ
 rrjLGPwlk61yheVsnYgPfYGWgPuyyZEz1V1Yh51KNN9PxtETGV4024pL095M2MNMBH7Iz2J/tND
 JBA/SDiC9FuK4MAtpqkZ6mS7Ir/Z2lCoJnwTPokxMDUStBUrqspTasWfz5AfOph9n3oj5w/KJ9y
 XrjPX8rqQhST3CbJ1Y8AY7bBdMzkxkPuo0ttSfhZ8hEY9Vo+xfhHUv3vD9T/tHgpQmYAZbB44uF
 C/WChAGSis9NM3Hmdgg5x2Osvj+PC+xgsczpl0iRo7nnv52RHEqOI1Q4m07kGA0PTtt0zEfAB6M
 ynS/ZPm/4vY/EDhkFcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfX+A+LHbqzR2D+
 s1aA1icYdxveI3uxD8Ix9y7853ZaB8iqPHFgUDEpJyQ+mYp1rSB7K/z9nJ6jrh2kCjyTN6tyu9A
 YSafAj2XIUUI86qI/RLw6ewHafAsoHA=
X-Proofpoint-ORIG-GUID: VNHV68HsiEuQ1WRGUPQD1uDSLhxjJVaE
X-Proofpoint-GUID: VNHV68HsiEuQ1WRGUPQD1uDSLhxjJVaE
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1d8fe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=915--R92nBw2hSefkU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_182519_340506_4BC18FC6 
X-CRM114-Status: UNSURE (   7.94  )
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

The following changes since commit fefaac1176bf3cf002a8dc83339d6ed6a369941a:

  Merge tag 'wireless-2026-09-16' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless (2026-09-16 15:54:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260921

for you to fetch changes up to aeaca27c1db3106967ffbb2b517d98c835f6d500:

  wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE (2026-09-21 10:58:00 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc5

In ath9k, harden the firmware interface and correctly handle a flood of
large frames.

In ath11k, fix an accounting error that eventually prevents clients from
connecting.

----------------------------------------------------------------
Georgios Karantzas (1):
      wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE

Nicolas Escande (1):
      wifi: ath11k: reset ar->num_stations on hardware start

Pengpeng Hou (1):
      wifi: ath9k: reject short WMI command responses

Toke Høiland-Jørgensen (1):
      wifi: ath9k: Clean up device initialisation guards

 drivers/net/wireless/ath/ath11k/mac.c         |  1 +
 drivers/net/wireless/ath/ath9k/hif_usb.c      | 19 +++++++++---------
 drivers/net/wireless/ath/ath9k/htc.h          |  1 -
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |  7 +++----
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |  8 ++------
 drivers/net/wireless/ath/ath9k/wmi.c          | 28 +++++++++++++++++++--------
 drivers/net/wireless/ath/ath9k/wmi.h          |  1 +
 7 files changed, 36 insertions(+), 29 deletions(-)

