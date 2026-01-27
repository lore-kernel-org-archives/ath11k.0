Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA17D2FED0
	for <ath11k@archiver.kernel.org>; Tue, 27 Jan 2026 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=; b=i3xGw8oC//jp82M/a7d5432IfV
	ivTr3Ez2TTY5qoX61MP4MdvWeb0MdVniQStaZ4fuHJIhh/NqJDJMXc2B4oBSFs8Pdc0Qc9NCb5H7Q
	X8ql7D3m5YuTxi5hHitVWl3TDQufVkqoBKkJ/MUTcBijEC4lkcyw+b2F8E7z7rdX8abefSC1SLJO4
	ltUmlUtfam54290T+KpDDeD/vMtmKueG0POQpoJh/aDIrlnDZfWDurYV2rbfFCYZjMXFAM7N5b0OB
	TfuV61W0myZyzVoFjpqPJ/vUwnl9KOm+Cf/C74ddCTLs5DsRXHYbmpT84TaP4l+piA+Qotu9L6WOU
	8DEF73KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknQr-0000000Em61-2ZPn;
	Tue, 27 Jan 2026 18:04:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknQn-0000000Em4l-2F2g
	for ath11k@lists.infradead.org;
	Tue, 27 Jan 2026 18:04:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH7YSe496030
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QVFvCbYDWuc9Uy4/cu59fE
	gOGvV+V4q1pRgPW41gc6c=; b=Wu2CaxlwPtwGU7jx4LETTa2xbPFQclY2GPd9OF
	oPy2bKq1wr46WVkA3VWYyt+o2Xg+3ggEUZiBl70EeORuGgFq5x3VqYd1VFCdEt82
	4O6RYZXtlr0GBM26TFs4oAwi81VPJhO8w1sCLJv6VevBqOYxaWPoCwMZbGjkLFf6
	gCzMgkFjAHPpEMKL76TzGoRzHIphz3oJ3zAOqrp0snxKuQwBvdiFVtxuGO3IjPjg
	lGBU76nldCzqxlckP8OgcXhm96w2BS91sraKzukOGVyF5oPLVq6IHGUxOTuEyjtj
	ghW4JoRux9nukEc6sDzdQhJrQiZsV7Xc9dnHlPFQn7SAjqCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bkwuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:04:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b722bc1be1so27177401eec.0
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 10:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769537088; x=1770141888; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=Mxx9twMJmzkyns8l7wCgAOJiVtySJONrrrDWavi2D9E7Zo298Z7wqlWT9Bw2QrMP/A
         wAZ/9tFFwzFE5pfXmkkzoYkzA7/tNpDn7FOQ22qyLNAzZ0FNVYhZIESYI6Dj6XyTUQ6X
         poGCrsaBApqlCEJvKXpCd+uk94ptdjYclDZQt/Hgh6pO2dNWiqtKBng/52N/ZcA+Deug
         /4+e3eDqbL8bPPlOa8E4u1p2gOvHkenGahkRq9hShG6Ow5grzaGoJM/K6BIumhWvDURm
         AwJq//QzR8FeY8d1/WJaGmyCgDVmGI3ixRJtvWGWoUhk/MLee2QqAkvUlj1ECgPn1uYf
         td/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537088; x=1770141888;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=VEFjmWKWEPmxuJrThH02kpVsceBNzkSp5QmADJFHmLw9DRf9pYKGvGa3AH5yjAPkRy
         LkoPz87iwrq+lA4vT7CxxZcWOLBKew5lN4gCEaDHmoGSv35s7A/uHfLaRl+IU5QBo5lj
         MQ6gOuBc0ZicGIp7Zrc1nXTlBwFB5HWCS0OxbQiKnnN1sKKgJw1YLVxCIIox++OBsXS7
         H1No0E6zJyfq4QTt8XmNDqVMJBhInGK7bKW8Eq6aHLfsjtgcpjRxTuve+K2PQWSDUuML
         H3kI60JJsnKjZ65RgXLjG6fnLrkikrHdCBRRduekpVeN9Lkt9VgpGuQjKtogN2Mfd31K
         fRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbmPdUcynN/P+ZDGDvzMQyYYwtiwZylJnxJ7xbAc7Bpd3NMpheR3SfXlBxS4ViaaPVFjXxurU=@lists.infradead.org
X-Gm-Message-State: AOJu0YznvI4LMHaGMReNKuN61gvjwmSYaG3A2CDJMGgObq1PG+fKGLXC
	59NJM/lfrdfatBkEVWYa4u6L+qxx28dU/MQ9Aj7kjPbmhnuIcAMN3PGB0emT9v/LqH+6IFmNm99
	Dbhhw6mQ38jQbQf8JOkF8PvPAuryNZXcOyAFNk0F+RqPvWflDBxKfROCsc10VmynD
X-Gm-Gg: AZuq6aKWcmD3Q7jF5zIYv1LAG/NycEuA9tU7AziRaFydlhELBn6NqUytGyBHjXLKq19
	jtrbl1QKDNYLF+g81kT7ILNgzppbXVI1UFxDYdMQ5hmCNf7gAizTQCoQAo+QSRq9lv/yq+4SUzY
	b31+5R/Xm2cB15FZ4nB7viJl6Zdgr49WJG/zQFrdGsNC3eCkCtDV8+yYoElKeRXLVqhUNXl02yq
	+7eVYGAbHVzpuSd9i5dpkYMBURxA1CXdy7qHzJQuACEnJ1d/AsnmW5Kborxr1rUkBwn+23i5Kux
	DzoQioR+Dk6FDaLR09Nn4rPwv5wo6DLrvCFUjBSdolLfK48jc/atD4cxjKYNWycOZZmsZ3pPjoB
	tHyi2ULCdstDuUQNR8rER9mZfLl7kpew3rjfUP5wg/r2ChA==
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907844eec.38.1769537088034;
        Tue, 27 Jan 2026 10:04:48 -0800 (PST)
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907809eec.38.1769537087460;
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c386590sm235612eec.3.2026.01.27.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Message-ID: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:04:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260127
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L1gqlnYZw_qhFCiyXCQ65hoB8ickz0G0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0NyBTYWx0ZWRfX8dUX32v6zHy6
 KYgQ7P5oUn/uEyehgAOfG7dN+FjgJP5EvqvDaevw8x2Xf0IWv7Jge4oFW1x/mS9S9zpERbQWfW6
 gdvUGidted6Jl47i7J61R4lYkTEIDVp9mRYt5Pa+ENfXvP2gWQSPvUW6w6VZs2i7PxKajkMuvGu
 8eP4kMp1xQ8MhrKQwCzAsSNvTtUBK1gPGImycru35cpkNDPODo4tVlu5rN4oI/9aqNWkA9JH/J6
 W0If5d5XGpFseuu9ELZBdyoIrUD/u2pPAc9nb1BPjz/M2IUJ75F+Wt6jSIpJJ/l71LxpfQ/YJ0W
 2nNVEvkyFKTblSEO4Yo/+8Sv9ic6QBfzNr31r+QI+LWwVCPdnG/1mduutPJyyk9gSCinKY1vBvx
 VYgsxe3CK+ttIQQnMIv6ZCvx7w+5rQTdu5emcfkgXYYQggMfVmnizMrMLyh0QBsXZugMnzJ6cpa
 5iAwLxIf+SXPnAD7n0w==
X-Proofpoint-GUID: L1gqlnYZw_qhFCiyXCQ65hoB8ickz0G0
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978fe40 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=lktd8AmUIn0x_5DxP60A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_100449_596345_B0DD16BB 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k.

For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k update firmware for QCN9274/hw2.0.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260127

for you to fetch changes up to 6bbca7605494e4a72b219c2d85a8026e8de3eef2:

  ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1 (2026-01-27 09:50:03 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046764 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7116936 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)

