Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE021CCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4WyeWiluWZ/Mjjk4RgwTvDiC7qiMUMmbWBorO5RZpc=; b=zl2X4R9347WLzUD2BrXpwnyPDD
	/UgdDUQWyeYDwmnAS9k6XLBK2g4v2vRj0cgnAP4osa9fFTuyad71P9mWJlWzoQ58j3kQX5Q3Dalwc
	g/psT4SO3swGOSaBzDTVH4FMhXKhzWhdPnE9sECw1tCYwLrw6w1Dfe7GLCqBE6p8eFmUVGkWpCah1
	B9n9ddd99JHBIadBe4TWyTqeVdWYuJOTXr4HXhO4ueokGlLUxh2aicm7F9VRq7Q3yFTzIIVaSFg2W
	Id+VACJAvKu8/KKSxLYk7gRE6qDGsENTlZeoGybkIaxKzP/RMSJ0o5cVm5LCQK19cmRxN99qP5Gb8
	f6875G4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0T-0000000673V-2CST;
	Sun, 18 Oct 2026 17:49:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0Q-0000000672p-3FYP
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c40447e25e6so153323066b.1
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345749; x=1792950549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4WyeWiluWZ/Mjjk4RgwTvDiC7qiMUMmbWBorO5RZpc=;
        b=WywxlePJEt0n3NOyfMvoj1Vy3zmjr+T6NVplRZRn9FnrP70H9ihecRuokr6IB+XbYb
         PcZ7uFOVEg4AQdpDacLnLA0jzLLJTKBPae6nii/Ng1xSRWFOSujTBLKBOTc0QFVzWOQX
         H9ByHgERMJBx5NaF+JKrJIbxqoAfiwYCkhWq0qV9trEJPlA1vvqHZ1ULoYC+L0fWcPfG
         C9xWBYyqf4YcO9GmmGJvzGE1VPS5wxRZzXmURLypF2tvWLropk2tfhhrz+F0lJTfIPNC
         U/uzmj/Ytc8AgxwHlFUqOQDffHwkoMbD5kwhQlZcbM/EjeWbBTECylBC0KaCjSU5nC5w
         SKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345749; x=1792950549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4WyeWiluWZ/Mjjk4RgwTvDiC7qiMUMmbWBorO5RZpc=;
        b=dL/tQPqn/nj9w2cj3F/UxznCOWku1uoSSiw/Tx/QeJBAaBEUtyxuS0rz40jMDnvWIb
         sY5kf2Os77b5f6kTC99PfEQi/3xkPquF86jRzeqRBleDLDoY+WkQvSzkHYwXIC/80t+o
         xHDiT+TrFw8ePI3UQqRVmc9iW5Z6+2XhpbqJugdb5SOYY5L7kAC72kAgPCC1L5jsTORt
         opghtaS6/OtyMFhIJvonvki23DoNjY2iKVbxPpeUHJXJIA/zOVFAOJsqcrAodAczJpu5
         oxP3yjCHB1CctKNHFdMlBve0yyyX/qBtMi/ExB2qQXEfsr0dtm+WEEG6gTXETQZbRrcq
         9yig==
X-Forwarded-Encrypted: i=1; AKwUvBxCVVN7KrsyXKpL2wR2Qfi6LtOLAtpL8MEubMeBEeIJtGwrrICIyEAy/gFZUr5oYIyTu3dCgkg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLwO86XKL1nxl6UX/YqexbAqoKZYmlTsfgK0AwsldoI4W/pawNS
	1uQwFhSCnVNvyzMiGkkzkYcrS77VfNsD9wA0fJlbsk/Fn5yNWPb+yEFC+yymOSsY6Q==
X-Gm-Gg: AYBFou179je7bNL33oJVHHFzQykU3FxdfLd8ukLfTVYB3KS2CkA/EtKZ1sKoIkGmGpJ
	usMB9yHYHP8irak1DU4O2ZIwxhcj1631OHkIvJcnqAKC/wYCWbsS082iGcs1BKKthUQT0JLZtJT
	p1yAnxDr/gTA+MBksCU11HN+1oKn4u4qCRuCdjTydRWnicjwoQmkP380TIsG6y6+AmFF4dIiBp3
	LkJMVKY2gSlughgBBlgT45vOjBfBktTyAyG1KbpPnh3xM/KowyR1ALdjK0SmxLoCPln+hEFFHPQ
	hst2Kr0LwBWsxcp1CiX7xZ1HaEDANH4VWVMD5Fc6oQFxrHhJH62qHc+M7uk0zGTEe3CgbtfKSQi
	SQ/X3L/AcAi/KBb5xZS/Isp99Fjkg0QWvSBn4d0gWL3SvFfJkvSD2B2Q+rs2wXkIHj2BUWKsxJ0
	3lgLMVykyn4MXK131sGqnaRAm2kJZm0wfRW+xY0zvLtnZLa+9ddWq0CkpBAl0PW6Mkixjjd2Xgt
	KFK4HAIEZoZXCGg8+aLk0Ej6K7DNH5tI6wFnJwj4NgD871RVpL1IPXhyTgrpuELYw8oBZuSM25i
	Q8ZCnkJmhqq3idu23AgmTUsDAqBJRLLl07N9nWMsNX/jWOjGuDq9KLmQ/8HeyGmoYYzA0KgklVQ
	3Zg1v0ANBNQ/FAs8drQPdlemtVJZ2/P3JUnC/rMjDKo5H7+6Vr4I7vb4h011y436RAQHSHM2cNW
	qggFA29rXW
X-Received: by 2002:a17:907:1c8f:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c419f121280mr364849866b.27.1792345748685;
        Sun, 18 Oct 2026 10:49:08 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:07 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Sun, 18 Oct 2026 19:48:55 +0200
Message-ID: <20261018174904.1757161-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104910_839282_AAFFB146 
X-CRM114-Status: UNSURE (   9.52  )
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

ath11k sets neither NL80211_EXT_FEATURE_AQL nor
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS, so a saturated download queues
every frame in the hardware TX rings, where there is no AQM. This series
sets both, registers tx and rx airtime, and runs the TXQ scheduler from
the driver and from tx completion.

IPQ8074 AP, TCP download from a wired host to one 1x1 VHT80 station,
default limits, 20 s, three interleaved runs per arm:

                        Mbit/s              sender RTT mean ms
  auto rate  without    92.9, 94.4, 94.3    111, 232, 231
             with       93.7, 88.0, 93.6    124,  51, 167
  VHT MCS 0  without    21.4, 22.3, 22.6    587, 550, 526
             with       22.9, 22.2, 22.3     44,  42,  43

Airtime weights are accepted but leave a 2x2 HE160 station at 45 to 49%
of the airtime against a 1x1 VHT80 station at 1:1, 4:1 and 1:4, because
the firmware serves every station with frames queued in turn. Ending the
round at 256 MSDUs in flight, as Toke suggested, gives the HE160 station
65 to 80% at 4:1, but at 1:1 its aggregates shrink from 258 to 100 MSDUs
(one run) and the two-station throughput drops by a third, so the series
leaves it out.

The series is based on "wifi: ath11k/ath12k: implement TX flow control"
v7 [1], patches 1-3.

v5:
 - rebase onto ath-next cd026e68fdbf and [1] patches 1-3
 - patch 5: the free-slot check runs inside the round
 - patch 7: charge rx airtime to the PPDU's TID (Tamizh)
 - patch 8: a round that ends for lack of room restarts on the next
   tx completion
 - drop the dependency on the mac80211 weight patch
 - v4: https://lore.kernel.org/all/20260908135319.754140-1-julius@bairaktaris.de/

[1] https://lore.kernel.org/all/20260917064825.12747-1-jtornosm@redhat.com/

Julius Bairaktaris (9):
  wifi: ath11k: free tx skbs through ieee80211_free_txskb()
  wifi: ath11k: enable airtime queue limits
  wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
  wifi: ath11k: report tx airtime and enable airtime fairness
  wifi: ath11k: schedule TXQs from the driver
  wifi: ath11k: run the TXQ scheduler on tx completion
  wifi: ath11k: charge received airtime to the station deficit
  wifi: ath11k: stop a scheduling round when the hardware refuses a
    frame
  wifi: ath11k: budget the tx completion handler

 drivers/net/wireless/ath/ath11k/core.h    |  7 ++
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 +++
 drivers/net/wireless/ath/ath11k/dp.c      | 10 ++-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 31 +++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 55 ++++++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  3 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 81 ++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/mac.h     |  1 +
 8 files changed, 175 insertions(+), 23 deletions(-)


base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
prerequisite-patch-id: ff44eb6f1d673e75bc013e3ffc870d7d30252c17
prerequisite-patch-id: 59bd66038e87bf2ee9ecb2a916286685c789f865
prerequisite-patch-id: c86d3c9047c851f45b5d46398850c9d810d82258
-- 
2.53.0


