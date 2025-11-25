Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B62D0E6F0
	for <ath11k@archiver.kernel.org>; Tue, 25 Nov 2025 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JAphU0cH3ceIFX/NL4RhLMIKJFwd3sLjevWt8KuG4Hs=; b=j8sDTZ++hZ4ul8N7seXeFMocun
	p1cxxeqVWeA65S/9dlZ1gRwuq9Ku62R3EZGxzTXTBi83+8QVY0emkv/05pb+rmjmRF8o8st/yA5hU
	6uOHmYYLVlQMnMamPh4p6PR7DUDoEcM3DcpSfzotq966Wkh83Z91g+kbKvJ30EUTwwVthP/ctuu+z
	Ptwso5XHNZI4lIBB3PeYTd/+xIJxCULEiz6bSFwaLB+BM3AmidhcP6/uVycDwSe3fTKHiJCVjM7RP
	mFlLqkUY8ithqAcO/bvVztfHo1mpLiMRrULvvchMUXa9UijULiZcElgZY/MGkkPgyOdUpEsAkfmIO
	3GObZ9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNu1w-0000000DQvt-1eTI;
	Tue, 25 Nov 2025 14:28:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNu1u-0000000DQvP-37QK
	for ath11k@lists.infradead.org;
	Tue, 25 Nov 2025 14:28:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b379cd896so3095317f8f.3
        for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 06:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764080909; x=1764685709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAphU0cH3ceIFX/NL4RhLMIKJFwd3sLjevWt8KuG4Hs=;
        b=nVHA3IdMV/u96gPN9Rw9GU6lSybuakoT8Im/3ZjM1YtWE9gRuFcnW7VB8kuk4EXPTI
         xauQan+Qq2Xb+hOttLsh1xNpNXsbvGxismhactfFfBkj8EF9R84dzNLhDpYL5rt4qGR8
         R3hMO7e30bbQVkYFdhXSpTLeGLxODlrikSYs+Uy5M21GciiNQvsbti1KfRDMoy7aCYua
         KGVUDyI0uExP29ckRIZNFK2OCnMfBsseZq26YMO13mX7JN7K7/l8K7B4lMZbvQqQZ+WW
         PeYcN50+ofaQQj2WpzVgDzx1Utg1b0wJnFzSKuoV4kmpdBqJrqLttwAWmJbEyfJ728GG
         hN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080909; x=1764685709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAphU0cH3ceIFX/NL4RhLMIKJFwd3sLjevWt8KuG4Hs=;
        b=Fq/M9gD8pazVjnUViGHKL1KXwTXttXX+DCA7T4qcpkHlLvsXLAD7a7J2Wms8k7KS0f
         bc7K5411/23Im7xKqx/aXCCC0nQOiHWX/FaI3zBGhQQOxc7AB+ql4kx05h+Xg/fBgLsz
         G2EQQRAHL6jrmNl9JpxZSOxrx/RmMwPSFi3KZbVK/cBKGYb9iebmR4uVCfFibBRKWOLj
         oQFbgrJDCBLsU6tugvwjXCEikSp63zffb3WRBN7v1L+MwyFEXHr2RI6O9cxv/C2ssGAm
         ZpSz8tU3SFFoKko9DuuoPo1ZsqqSxGJTERyPKdxc/hNpkZ/cnM/1v9cZdleYX79xUibt
         vT1w==
X-Forwarded-Encrypted: i=1; AJvYcCVrRrf7PxRi6zuX49rNzsZxkdiVCzTWDmFsrXdDs88XfaXGRFlwNjYGux6Ker9PeCcUmG3wDH8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCYijGoG45lE9F9kyi8kltP7h4QV2vLjPrNdo8Nxv5sRw03fRZ
	64fPekEtyD+c2RjOiURNZtep51/IGnGSOHCnME8RYjQtmLMtQCnlcrxN
X-Gm-Gg: ASbGncsxQdoQvRUy0LQ+6PvtmFTmBjAK5A6uWZDINdEXLjC3bjGUHohnW/H4JWazEX6
	BT1Mv5ff06VeTEgIpIZ3dbcblfCZIebiKOrrub9nJZRPWwyyvN2m8decGTADAdEuye3onx4MMvQ
	voqB0OisJ486I2MwuEJPj2lfrOh3HWG2L9ClN1tYHP5o/1d6hgC4Z6QX7Df4kCAryfnz32OSTBb
	UuIQCknwcPvlC2w8LhZSO7IMqKjsRQ2daBqWERq5VgtTQtQoMuPIzcq4XetWS67sjNvNIZnvQGD
	/A96TvEU/DAujsrR8FlJdctMKjR9PAw5eN6x18mJhIGCrYBzGjmOZG5Kt/EtgS7zQrwEKvbcW2h
	mGVK6EAqcTu+IftfVjQkX/0J7lq3nNCpc/2uXMS9AvY/2N/Dw4/nXrelBAIWrjR6sJqwU64cwrI
	cy2Dpyjahi95J5jriBbIT+Oadfzg==
X-Google-Smtp-Source: AGHT+IEqA6HDUrBNX63cSpBKkeoaSj+oHLwImQUfcsZ2vVjQkznOGyiU7c2nMqKOmiSejP6/HoFHig==
X-Received: by 2002:a5d:5f44:0:b0:42b:41dc:1b58 with SMTP id ffacd0b85a97d-42cc1d19957mr15867880f8f.45.1764080908831;
        Tue, 25 Nov 2025 06:28:28 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8c47sm35959194f8f.38.2025.11.25.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:28:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	P Praneesh <quic_ppranees@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Scott Mercer <TheRootEd24@gmail.com>
Subject: [PATCH] wifi: ath11k: fix rssi station dump for IPQ5018 and QCN6122
Date: Tue, 25 Nov 2025 15:28:14 +0100
Message-ID: <20251125142821.18152-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_062830_817879_F9A18065 
X-CRM114-Status: GOOD (  10.51  )
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

Commit 031ffa6c2cd3 ("wifi: ath11k: fix rssi station dump not updated in
QCN9074") didn't account for IPQ5018 and QCN6122 WiFi card that are
based on QCN9074.

Update the .mpdu_info_get_peerid to use the QCN9074 variant to correctly
receive consistent RSSI station data.

Reported-by: Scott Mercer <TheRootEd24@gmail.com>
Suggested-by: Scott Mercer <TheRootEd24@gmail.com>
Tested-by: Scott Mercer <TheRootEd24@gmail.com>
Fixes: 031ffa6c2cd3 ("wifi: ath11k: fix rssi station dump not updated in QCN9074")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath11k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index caa6dc12a790..05d7acbbab56 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1175,7 +1175,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
 	.reo_setup = ath11k_hw_ipq5018_reo_setup,
 	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
-	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
+	.mpdu_info_get_peerid = ath11k_hw_qcn9074_mpdu_info_get_peerid,
 	.rx_desc_mac_addr2_valid = ath11k_hw_ipq9074_rx_desc_mac_addr2_valid,
 	.rx_desc_mpdu_start_addr2 = ath11k_hw_ipq9074_rx_desc_mpdu_start_addr2,
 	.get_ring_selector = ath11k_hw_ipq8074_get_tcl_ring_selector,
-- 
2.51.0


