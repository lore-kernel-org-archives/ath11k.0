Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BFBD2F34C
	for <ath11k@archiver.kernel.org>; Tue, 13 Jan 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=; b=rvMHe4JOTIHYSeXs2JReBpDW8+
	e+zau17fuJJ871uxmZsOr/gOLG6Svs5a9A/m/4NsluH89ghMFW9L4BnuxPkQl/iOp6l6bTYJS56V2
	NlvcAmHfY2Fy/8IX8qLXy28Xje+EWTLCgLO/CjBoAObsbWaj2FueyZfHYCdaYNkzBbxg6CSofuWJN
	zur51d0hZsjNhSUd1el1lYly1ZBsxQaW4N5HMsds/gygt0j3Px4EogOY3wzxYro4ZaOaqABerokYw
	IBRl9IiNNspXVdn93INHnCaRnAxGN7f8tKjRaJaqUGYFgYaPXYyuLND11dh/VfHLaEGBe0W80JwOh
	G0a1Sw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiHI-00000007XHr-18Ld;
	Tue, 13 Jan 2026 17:34:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiHF-00000007XGn-2hKY
	for ath11k@lists.infradead.org;
	Tue, 13 Jan 2026 17:33:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DHQ7tk693899
	for <ath11k@lists.infradead.org>; Tue, 13 Jan 2026 17:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3WDCTtPX8ZwvNdg61wmwVg
	Z/agZZgdp9VQEclxu8q5g=; b=haPXRqEP52EHnTIMb6QTDSdDWJVDOJ4csdx0s/
	zIf0AQdYY/lNEkeLBdHgez+ZwJGhmnonKLyuOyZfT+88pjUcYXViXISS/PnlN67h
	6Pn9FHGlALVtUqEiTiik8GWQhOhkC4a1n9ep+RPjVHtBrWQ8dDfXRL3RAN90qk+8
	KW6yOBJsEcBMXqCfJvE8+fPsItsPr0yYiVSUrBy4iRupDDiJ1BDjue4YzK2cFfwD
	woJJ+FN1mcGqn+mc8DLDcJNJ9fOyntYiGyWH8k74cXnuFk5eqESVJaEFuSXSmwn8
	rz1/vQmQeWRDaGNy0M07Bbsa1LhhdAsMMQziY0nVpSbqNZAg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bntet00va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 13 Jan 2026 17:33:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b048fc1656so23813212eec.1
        for <ath11k@lists.infradead.org>; Tue, 13 Jan 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768325636; x=1768930436; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=;
        b=dboh0nOw6dmhh+xGnON0Lq3YQDcLZACAREK7DsyLaXat/m9RyCfamlUJUIG647O6yH
         T9giwi82TPK7ySCZL++I5vseQ0URmcHqPLmGQrvk7K6E8mQVVJ88/rbc13uk9+Vkn9/Z
         DidFmd3LTsOZ6rPJJNt7P6fAWwZX6l/c/DX/DolLbq2viRuF3T/GirIoqjNg1C5SZDca
         /fDxIkdrjbr+xmoj/TY5GVetqZ16Ry6SFALM/2nWpBWdxnq2PX1eHVZifG/GLQT60cPy
         +ziRmgAbzCwnsXMOk6Hvqs5zFha3bGQpoh7j8IhFJrALaz1AesM1X/Umpfle3I8pGRhd
         +TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325636; x=1768930436;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=;
        b=blyrNMVJaFRjR50KWpxFoCO7iUADdRU/h3f1Yx31agAsvQ9jE6gA0LnF4D8Jst78vO
         ic0a/7OKjOJl2yI8HSbBCGIPjcn47gXxY3eIlj9qU0dSnlIbhiV/dcf0nsHlSUDczamO
         WWCVZfx5Tpmks+uINzIjslIdBKok1iUog9ThtXR2lSiC/hBezhbCkBZjOYysrEi0rIns
         cb/TATFGVNJPQEJTrfhYnALU4lJ1gyhHYX2EpArBemYgDNlOg2hgEOvmtEOlGXs1sXdS
         6cGFW7RNE0S7rYMYtOjN+EpG9+1hOf5TFnaydy/DfO5Ekn5ThWEb/6gVU2E6fLq4nDuo
         ojUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUkwj3iKqje1KQZZNFs2zDOSNo9UN1JAdnM8+zuo0qTQTryLMbKw2i95L5ACnkdAQCwQ1tvAg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwF6G546lZAcYZxeKnB53PcxXYW7lySMO7igEAxMqw5hi1bzC9o
	fyU5xHHwUff+hFL1S1+wYCzAknYgl+8mV05nTWGOsb7GVnuiUMOnD1rTuj4Ia3gnF7OBcUe7cQA
	np3P7diKEwxDZve8NHjQDRB9qodUETAg6u59FrOwa7zbw33zzFOndyQK4TtrTIBhOYFxgDha0
X-Gm-Gg: AY/fxX6xNwTB6j/3SfPF+GiBE6G5up3a8xXE81el1C1bm/6Y/Ten5scsmIgNAIzPx3a
	Ul1vOhAN8P8wSbkzHUfPXvz5iZYXOUUAQLqrpjdITOiVq/idtXkFx1cBcWDmfCVJKEdIGssH/z0
	YvqwY34lxB0KTh8UxjwPlIvct/adD6tPUFiqnKqNLiNtfdgCl6p6tN+/KfYxVMvZ9H/wjpw9YT8
	NhCKOr+EHKym4NOJNeg7PHXBF6nhvdgaSjb9CsgJD9yQJ7sCYckXOSQm7pYEasD5qiG9tBo9bnm
	P6JMtuGh2sVAs3h6rZJOl2CUMl96r3mQKUuQPD3K7Dra/OAwrGQnrLu9VhAN7dVF0MWQdI3cPmt
	NzZPILDPUfHJ3bBw2NC8KgEoMRypUSl1Z3nQbffSD9WMj/Q==
X-Received: by 2002:a05:7300:e9ce:20b0:2b4:7971:fb66 with SMTP id 5a478bee46e88-2b47971ff25mr891143eec.41.1768325635986;
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlVV5wiowpUo2Nox6aqo/BkpUnum6WEyQXQkmPHOgyzMlaQ96MbXJbsrdZQzciQWHXFabJGA==
X-Received: by 2002:a05:7300:e9ce:20b0:2b4:7971:fb66 with SMTP id 5a478bee46e88-2b47971ff25mr891106eec.41.1768325635342;
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b45e73b401sm1283444eec.21.2026.01.13.09.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
Message-ID: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:33:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260113
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K4rEKvhR4uEA2gHJHhl-ZKrIzAIfti4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0NSBTYWx0ZWRfX4GQtPTi97Oq6
 kq1bV1I8g8z0zpgiAZv7XD/IRuv2JGhHhNMkaWhMEkm/8ZgDSwgYnXQ7B1xjjITJVgPYgdQrp8m
 bSj2AZ0g6o+T+EOmo1izuOqm22Cjht/VA3y4wEIUU62LZv6g5jxOBd69a0epmtxhbfUZpzqNTzs
 A9WR7Ptl8dZ3NxFdbZnFI09r8+tF4SNr1DQB3SyiYYIe+1oWGuhdkfs5jkjB2/TvZQpd0QfOGiP
 UKyAFsqoVINKw+A6WspM4ThFVe5Kdnf5NanRBnSaBzKZyEtuV457OJbxAUX3fMw0fyrr6JSDgHJ
 9dhJPQw3PFDupjTHIPbtHzc/FyFdGD+MTeiuMoWsPkzz7CMNFjcHlU9X5IcQXpiQQQ1zKMJ/HVE
 zZ9wBHBS5y9/bKsWqJIPunLG9YMQ0ENm3QNn9uvkHrHMgA+cLggEm9bFtxYnxdflGoN9yyiKtVN
 yVMdMYbxrjg9qW/+TaA==
X-Authority-Analysis: v=2.4 cv=TMlIilla c=1 sm=1 tr=0 ts=69668204 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=jiOn_W3BcUuOKtM18IsA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: K4rEKvhR4uEA2gHJHhl-ZKrIzAIfti4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093357_706223_D64E7E22 
X-CRM114-Status: GOOD (  11.96  )
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

The following changes since commit a203dbeeca15a9b924f0d51f510921f4bae96801:

  wifi: mac80211: collect station statistics earlier when disconnect (2026-01-08 13:33:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260113

for you to fetch changes up to 31707572108da55a005e7fed32cc3869c16b7c16:

  wifi: ath12k: Fix wrong P2P device link id issue (2026-01-13 07:25:02 -0800)

----------------------------------------------------------------
ath.git update for v6.19-rc6

A collection of small bug fixes in ath10k and ath12k.

Note to maintainers:

This tag includes:
31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

That commit contains the following:

Note to linux-next and netdev maintainers:

This patch going through the "current" tree conflicts with
the following going through the "next" tree:
commit 631ee338f04d ("Merge branch 'ath12k-ng' into ath-next")

The conflict resolution is to leave the following file unmodified:
drivers/net/wireless/ath/ath12k/mac.

And to apply the following patch to ath12k_wifi7_mac_op_tx()
in the file drivers/net/wireless/ath/ath12k/wifi7/hw.c -705,7 +705,10

 			return;
 		}
 	} else {
-		link_id = 0;
+		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
+			link_id = ATH12K_FIRST_SCAN_LINK;
+		else
+			link_id = 0;
 	}

 	arvif = rcu_dereference(ahvif->link[link_id]);

----------------------------------------------------------------
Baochen Qiang (2):
      wifi: ath12k: don't force radio frequency check in freq_to_idx()
      wifi: ath12k: fix dead lock while flushing management frames

Manish Dharanenthiran (1):
      wifi: ath12k: cancel scan only on active scan vdev

Thomas Fourier (2):
      wifi: ath10k: fix dma_free_coherent() pointer
      wifi: ath12k: fix dma_free_coherent() pointer

Yingying Tang (2):
      wifi: ath12k: Fix scan state stuck in ABORTING after cancel_remain_on_channel
      wifi: ath12k: Fix wrong P2P device link id issue

 drivers/net/wireless/ath/ath10k/ce.c  | 16 ++++++++--------
 drivers/net/wireless/ath/ath12k/ce.c  | 12 ++++++------
 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c |  9 +--------
 4 files changed, 25 insertions(+), 28 deletions(-)

