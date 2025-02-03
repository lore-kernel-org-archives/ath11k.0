Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C5C02199
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBPNZd4PRgKycBmyjDhvYaIoIeOcHmWZM86wacoyZjo=; b=Co5rIcts8/y6wzX4Cnca98mFF7
	YPq1YtnDJbTj4ObxAcVA7XMPDS8yijfNXQc5Z6YhpUT6bKidh32l8Qjf4VQrgBmTM1ZHoAwCUF7oc
	BLyMpUGtYFFbcaGQI2O1KQoCPvhzEICZVVtCtvwD1Nmn4Amn4S3CfHnzKI73Fv29bwNkr1aK02Ixb
	NoKI9iFQpatn8F2T1yHT7ZY1PCx5QvP1Is4PUjMlua38FhVPBTYhd7Oih1KQ9cmxQ2+VQo+B676QH
	DfKvC1YuB3FUXDPRPQIbybqvErR9nvi1W4DRxFVbssoI1s/D+3gIMItRd1Un3Zum/kdwZqBu4D7/6
	+UoJY9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fl-0000000GpHU-2awD;
	Mon, 03 Feb 2025 22:49:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fj-0000000GpFM-1fkl
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E6wDG005762
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBPNZd4PRgKycBmyjDhvYaIoIeOcHmWZM86wacoyZjo=; b=T/BrbjkgCmLcuKXV
	eu2TzjA5kDevaWQ6MxgL196gkh0trBcOPP6fPtidLIYbFoTiHKgwP1Hn2s39So0U
	a6kRmPg78MyL/OTiUBuFa1yIrYtFaick1FSRQXAjXpc7t7WwKnEABT2P9XAG1Jpx
	1MKYa6j2qw4k5Rfzq6HS0CqGs9lvUOQg2I5nqxafLUs0kLF0QqWoo6Kfm0O3in/D
	v6cy6MyJRU2RqCbqHhQ8q4uLBoU6yd9Hve75zI5nGuc/07kr5pQ9aBf+pwXAqTJv
	KUm2bzBz4xNIFoxWHkbZvxmhPb+hVFqQjm1wOpHmDq9SWAazAhbFaCuk86+ElUT9
	Wsvp4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy9g14xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f03af09e9so1196165ad.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622954; x=1739227754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBPNZd4PRgKycBmyjDhvYaIoIeOcHmWZM86wacoyZjo=;
        b=b+RzcNts7eykh8ydIbNzjf/XYd4UZLu5i6Lw/INfENRKMznAxBI63lHD8nuqfhBpQg
         IkLRqVtQtN/HaifqZi/+DAtC6F2pF6AOwdZn0TYLiWwtNihCYkfKX/E6boCplky2vLX8
         MA80H4N3IaxpD/s5XbB6mgTHKXSK4knqPMozH9j8CnmEXDC+bVyPTquH9pBcmBPuLhlJ
         pp/Ne/wYys6MEaZTVsK7LNHJWjON32wo6FusGqmSzLQcxJz+R1zrsD5yTEDH6L1dSMKq
         arcqcyrLX75GypsQU3LMIy0Uz+QuhQoz2Q08Wk1OZBJLeFhQiCc7dzbvn1yb0Z4N3x8o
         VLsQ==
X-Gm-Message-State: AOJu0Yw6TjtQiDBBBdyfI94JaT0W1U7qu0AiinmJjlm0i36mUJ+j0fr2
	WX2xmGHSsXm5Kiqqhzu60n6aPJT0GUe1URVT7KTUIJ783TT9/xwbkyFkG2I5dGrZ8rEr3gmOBvH
	HlbOY8xCIbkFYL20ckHzejVEGf7O2frf70cVeWtUs22rJ5RMjHJTrX+RcGCfN
X-Gm-Gg: ASbGncvsDuZwmy6O2Abiae0QInSBeoSbMggXGLW0DAtATg4/PCxWbFyLnUoEa0/8RJ0
	LJcjeeZx05TcHQl2sur+Ynt7tnNfOq68cn3scwUyL+QKgOSu10568wfxgA7a7VHHkPxMGopA1pT
	kgreR1z/v9lgTJjO8Nk96Tm7HB9GffiQhVEiCYE/tm5jxv1nYydB/iWj/B65/tPJREp4PQlmrgo
	MaiN1x9Xg2bHLNzHvKsuAzcIVKb6MOwWZ2SghBQtQi8vCmZ1++2YVysByPhx2zkQxaeGW9DbLbB
	dDktlDd82ocKJlE5eMspGkzEaoh0pRsfNfQR5JBExA==
X-Received: by 2002:a05:6a20:6a05:b0:1eb:48e2:2c2f with SMTP id adf61e73a8af0-1ed7a5efa87mr44743405637.30.1738622954051;
        Mon, 03 Feb 2025 14:49:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFpGz9EDaUNWuzYyYtq/xpl/W+Lzv4p7XgJL9p5ZOkMlODGqlM3XWKKonWHwyqH6CZlEDo2Q==
X-Received: by 2002:a05:6a20:6a05:b0:1eb:48e2:2c2f with SMTP id adf61e73a8af0-1ed7a5efa87mr44743377637.30.1738622953666;
        Mon, 03 Feb 2025 14:49:13 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:13 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
References: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: fix wrong overriding for VHT Beamformee
 STS Capability
Message-Id: <173862295307.3734728.17015515287970538991.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: zSgaQO0XyslCvqq0mCBL2ArsOEcAecfH
X-Proofpoint-ORIG-GUID: zSgaQO0XyslCvqq0mCBL2ArsOEcAecfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=567
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144915_440055_E2857E5D 
X-CRM114-Status: GOOD (  13.04  )
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


On Fri, 24 Jan 2025 15:59:53 +0800, Yu Zhang(Yuriy) wrote:
> Current code in ath11k_mac_set_txbf_conf overrides nsts, which is
> incorrect as it confuses nss and nsts. nss is Number of Spatial
> Streams，nsts is Number of Space-Time Streams.
> 
> As mentioned in Fixes: 55b5ee3357d7, the nss used when acting as a
> beamformee in VHT mode should be reported by the firmware and should not
> be greater than the number of receiving antennas - 1. The num_rx_chains
> related nss rather than nsts.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix wrong overriding for VHT Beamformee STS Capability
      commit: 9d13950acb2a51342c93c69f1a5bf285adb90d88

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


