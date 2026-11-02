Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995660A260B
	for <ath11k@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v8wMJa+v;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhF5OG5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6nXMXQjY9+cB3aji30VLYEiRwuVBc2jJoHH3tGpMNSw=; b=v8wMJa+vSzJD5k2uSpGVtXRVRD
	HOTx30CAZHDt2tL3tn+RqVCBhuPRNqauLVp3JfPwb07XSDD+Na+ZKaiJf+R2kCirdZ06MUlJgPgam
	aVBbuT49km+Ier0NnVBvEmP0dk6XgeGaAunQs57wpj2CyWLTUz8UoZM5o5Q5spF9e2mmsooioQ/++
	4dLBSngPsVIGrSUz2giZjBh876ZU7MMnQuKP3t38XP9e263hd42aIA0lZux/OzJhMQ7yVrN+X+0u9
	JKgD3Ku+X5oY+ojn6PIM2R7hp1FyfeaQGyis6jX3R55OBtQXuxnD11nCjD62yAKYyauaS20mCXLz0
	h5CYaZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN1-0000000FXx4-2fV2;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN0-0000000FXwc-2hmz
	for ath11k@lists.infradead.org;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 536EC40DBC;
	Mon,  2 Nov 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793596450;
	b=rcrEeXfQb/16X/pBek0C1YWzBT+K1iRzr+89BSvP8xj/Ness2h6GvfZmOfrOVprxi2Fa
	 kWnADhlRNkcjZ6rl0Md+c3cQaYzTHKg7IjWxcSaEJ3FaQJKVQ7CV7wNx3IxDg75yfU+o3
	 BMqOlp+OIpdmYVT9XhF9sK2H1IMGovqMIscYpoEXv+mRrnVCnMkVg5fiNSZjhWVw2Jrhv
	 7eE2xB6en3XfPJYnQ9j0wXzO68DaKQ368vhp6PEITiTUVvKYgncnlEs1U2xOt7ztZ7qSf
	 7LOtWK8/oG/fERCrWlC/jtMqTzBfXiqSZ1VM63upwAHLbRtOii4fv8GrdvGY8fiii3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793596450;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6nXMXQjY9+cB3aji30VLYEiRwuVBc2jJoHH3tGpMNSw=;
	b=hiJLQxn1y8k5NsZ2yu0HoIy67AlCaGwi8vTHYpx68KYPzDPeEng4lY6y5IbsnkeeGPJ3
	 d0NKse407d78mfvi6f2MUtpKmkY2AateDfpTZXWdQ9oPic8iBIS5QAgJtMWaXhVcl0gTC
	 ZowVU6EkxVbvyjKoKNdIQqJkzp60ZXZdrT07jyhaDdnKrFEWUYkjeWoXcFNxPijSFMopl
	 2JdZhftBuLGIN/niyoBpgaaqNatqiRu1xsw2KGjZERjPTzBrXZpsZmKiYCIsBp/kVx9sA
	 SgPYzbtDa5lLHht2q2WUuOVp//uucQpaHbUbInvqHur8TrAqGla6QrFgMUxUEmX4nPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8D0D1F00A02;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793596450;
	bh=6nXMXQjY9+cB3aji30VLYEiRwuVBc2jJoHH3tGpMNSw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZhF5OG5yRbVSOlKk5G3gIpfXy0zAwnuHmli0191VpbAgtgrhd3l/84J+bPkG85nGc
	 JqHg8taNunXyxxFHWgAlu0zNS8x2oxl/XJN44fPlatJKtK66jHxXBW+6tOF4kLoKgN
	 IEf/I9Ow8MlcyBtXrpOLpoNbB5MyL0RDAbJleBRUQ5p6gc0PnNLMwrGgTT4B5Hla7V
	 9f5ovdb0Zn9OOTt7uhj4DVPMyWg/Rr2P96sz82qdujEpUtNSUZglxvEOp2+wWzuC08
	 Krnhiy3GuTav8xYoDyqGl4G8c+4HZ2QzIK/qCZOgQR0vWAl/IovogBHccz58q6iMk3
	 EBbWIBGJtG2yQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0AD0346378;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH ath-next 0/3] wifi: ath11k: monitor frames: length, FCS
 failures and rates
Date: Sun, 01 Nov 2026 23:14:08 -0600
Message-Id: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAc6GoC/yWM0QqDMAwAf0XyvEAjTnS/MvbQapwZ2I6kDkH89
 3Xz8TjudjBWYYNbtYPyR0xSLECXCobZxyejjIWhdnVL5AhDh0uKkpPipH5hw9Bw3/UN8dWNULq
 38iTb/3kHn2eMvGV4nMbW8OIh/5ZwHF8H6ANHfwAAAA==
X-Change-ID: 20261101-b8-monitor-frames-b4e98941e50d
To: Jeff Johnson <jjohnson@kernel.org>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Julia Lawall <julia.lawall@lip6.fr>, kbuild test robot <lkp@intel.com>, 
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, Miles Hu <milehu@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, 
 Sriram R <sriram.ramachandran@oss.qualcomm.com>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 Rajkumar Manoharan <rmanohar@codeaurora.org>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793596448; l=2389;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=aiMBWaeP4VCoKPc5rfu9vnen1taSbfQUzIsmGYDSs4g=;
 b=EfICl5+ggRkI4hafYcauThS/FzFKTwkOo0MqIeugjSa2A0B3CmWUvYtqbT3Kvnvxnci3pPJOO
 kfpnjyaJtM8C6ek9XVN0zdieLc+owJq1CIa0/3CS7yLosh0sf+RL/B8
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three fixes to what an ath11k monitor interface hands to mac80211, found
capturing with the QCN9072 scan radio of an Arista C-360:

1. Size monitor MPDUs by the chip's rx descriptor. On a QCN9074 a
   monitor frame kept its FCS plus 4 stale bytes, unflagged.
2. Hold back FCS-failed monitor frames unless a monitor asked for them
   (FIF_FCSFAIL), as ath10k does.
3. Report a monitor frame's MCS and NSS only when the PPDU's SIG was
   seen, so mac80211 no longer warns about, and drops, a VHT/HE rate
   with no NSS.

The series applies on top of these four, all still under review:
- [PATCH ath-next 0/2] wifi: ath11k: two monitor destination ring fixes
  <20261024-ath11k-monitor-buffers-v1-0-ff155feca2f6@gmail.com>
- [PATCH ath-next] wifi: ath11k: update rx_channel on a channel switch
  <20261024-ath11k-rx-channel-switch-v1-1-5fc2ba53ca8f@gmail.com>
- [PATCH ath-next] wifi: ath11k: report the measured noise floor of the
  channel in use
  <20261024-ath11k-survey-noise-floor-v1-1-8eb03002aab8@gmail.com>
- [PATCH ath-next] wifi: ath11k: add the measured noise floor, not -95,
  to a received signal
  <20261029-ath11k-signal-noise-floor-v1-1-8867d25298c8@gmail.com>

Tested on an Arista C-360 (IPQ8074 + QCN9074/QCN9072) with OpenWrt
main, these as backports, on the QCN9072 scan radio's monitor (no
fcsfail flag), comparing captures of the same air:
- frames ending in an unflagged FCS: 353 of 400 (88%) before, 0 of 800
  with the series; beacons whose elements end at the frame's end: 1 of
  43 before, 60 of 60 with it;
- frames with a bad FCS: 44 of 400 (11%) before, 0 of 800 with it;
- no "Rate marked as a VHT rate but data is invalid" warning during
  the run (it showed once before, in a longer capture).

---
Christopher Griffin (3):
      wifi: ath11k: size monitor MPDUs by the chip's rx descriptor
      wifi: ath11k: hold back FCS-failed monitor frames unless asked for
      wifi: ath11k: report a monitor frame's MCS and NSS only from the PPDU's SIG

 drivers/net/wireless/ath/ath11k/dp_rx.c | 75 +++++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  3 +-
 2 files changed, 63 insertions(+), 15 deletions(-)
---
base-commit: c5546d76a980fc035b20fb7932e191e6138dcb91
change-id: 20261101-b8-monitor-frames-b4e98941e50d

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



