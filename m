Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB187C5CFDB
	for <ath11k@archiver.kernel.org>; Sat, 15 Aug 2026 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZKulgw6Epf238NDoYfOuRcBGDo3h5LDiPkO20LU4FE=; b=tPjsSDXm42BYxntpTlD0mUWJw9
	7DVcMwZzBKZ2+JG10AYUw9Xw7Zzz1zzQDfrlgQ0y9bCiGmLf6P88fBE6DwwLKmLh1SHDDokksTGdH
	2NKy6hEZkgMs9+1qrj4kZSbokfUcKVcP/elEZF4qChurjR8osYcjk3Ad2mdkxvHLgxbsfG4YbXOC4
	jWZHIvxk3bd+5V0sl6gPhKsC0swXFyJ7Lo0Zy+6KXxaq6LW++NnYS6zstDF9xxLP07bZtt5TueQJs
	xOtP7KKFcERXj9UwresDhf0E7qHMQ3Dd1y8fTIHuS9dtzZ52JwDsZoZr/biWdu2c71E/o4kH152z4
	Qyz+r1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvG4Q-00000003u8q-3F7Q;
	Sat, 15 Aug 2026 15:13:14 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvG4N-00000003u7q-1L68
	for ath11k@lists.infradead.org;
	Sat, 15 Aug 2026 15:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786806777;
	bh=FZKulgw6Epf238NDoYfOuRcBGDo3h5LDiPkO20LU4FE=;
	h=From:To:Cc:Subject:Date;
	b=o4Usye67paOGyeillslaRTrmw3QYCkpOuOCZ8xXHXs/PQnlcu07z+RpV9PkBsWTmJ
	 FRri4UWUdlYpUab1PpIJSZmGv0Jl4YEt/psRQKtGbPVE3EdpF054r/3bo8avkxqFYp
	 EMzmr3zxYv0C7MavOQkL9XL38w6cEe+p9evNUDRE=
Received: from linux-wireless-email.txt ([117.155.170.226])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 336A1449; Sat, 15 Aug 2026 23:12:54 +0800
X-QQ-mid: xmsmtpt1786806774ty3mwbais
Message-ID: <tencent_CA929E144EEEC926E8CFF32B18ED3A26A907@qq.com>
X-QQ-XMAILINFO: M6rEOT/Vq/kGbSVX8Tun/ehPY5f3k9dt+2ra/7xvtYWMlORQZ8cGf8AXluONzF
	 eltVOfjmXBwo63Jm1dDHlx0iaMH3HFz/MWAeRK3tJ0jnaf2QPwT0jRm3VcxeLgoaOWPcpuae4ARZ
	 mrlbbhJotlvveQygKU1tpdnoKOYjyeBxdHVsCXItv7NAzfoK6ROykc85b1TSo6OZHDwd+ztCh393
	 WjdHCEwmkq+QxKCYInK0aVTvgicdVerDm0doEGksnZhH030OpPr2eUnJsr5S6uhWc7CvJjYImT0j
	 H9+zLqL8nxY0BgVuCLlRAkScgWX1x4YtwrEyaoHsCKvrRKiEdW/uZ0eBisb2+ZKRyFUsmAkssjtk
	 Nv35ZqJ0wMrQtJvRkS6FZae+7coXLQ123aZZfX0/TcDQc+l5ZxjbkfHeagAs/SwcXDScmNTUAXcK
	 52P2ujU3CQAmB0DAl3qE3XwKrVrgh14S3fFzPXQ0HHmVwmzU7T7fr2RmXauvw62NdgMwtpcTXgtm
	 vCqSnOuABKpYzAUL31JH15CigXsRhRCJb2nzuhyYVFJi301WZNYSHGyRMMvoG0jsYddAAcc4S1Ym
	 yJSIXNZFb6mgwvBtQspSeYPLMzedq3Q4XSBpjmCm6HpuvcEP2j4BfSV+tJEm8QQmg8hbTOWCcetz
	 yupDLmc3ZD0DRJS4CHnFdmDAH6AYwLN6WKCG3tG617tXBpnajVmnfzQnvdetdGC0vRYvNjKVmNY6
	 y0Kb4zWiooIfGzVBh6qhkCQ/pvMUrbLrOOvtbIJEHaiY6bWtnSYK/jBPJFn/No19VZjFQflpcE2E
	 Dt0E+AEjevc4Vzmj+yM8PjNyAI2P2eQifwyudfPx5SDLqHlbf1BFC85RXSeLqQAyojCfrqWrxHbN
	 1bw1cRvHXwf5+4q6Foqa+/LQ5gv1WCtsTQsherrRcsB/j3xCbx1dghpoe0n3JHioiiovavQdaNB4
	 tuJUgLzzsN6EqxgcCLnyq+B7rkHvHTBXRpoApfea0sEStuaD2qGF1YK3nx3CLVNWyE0GsYwUCugM
	 WIp2Jetu2b5qAD+kQlZm5vLhdlh9v3iV5tjlbTVSVj+dasssKK3M5GTYXG3YbHjH2ApjCsCh+yLX
	 WUzRNyrccSggEBQBrD/1CLxgFWhMVUf0NNqrvTpdpX41IUC0b389QO10PVt/3d0gRati8n5S9nLw
	 z3bs4=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: autumnshiu <autumnshiu@foxmail.com>
To: linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org, ath11k@lists.infradead.org
Subject: [PATCH] wifi: ath11k: fix QCN6122 UNII-3 channels 149-165 disabled
Date: Sat, 15 Aug 2026 23:07:38 +0800
X-OQ-MSGID: <pz-l8-unii3-1786806458770268849-1000@autumn-NucBox-K6.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_081312_155370_11D6C0DF 
X-CRM114-Status: UNSURE (   7.01  )
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

The QCN6122 firmware reports high_5ghz_chan without the UNII-3 band
(5725-5850 MHz, channels 149-165). ath11k_mac_setup_channels_rates()
passes this value to ath11k_mac_update_ch_list(), which marks every
channel above high_5ghz_chan as IEEE80211_CHAN_DISABLED.

As a result channels 149-165 (including 5745 MHz, channel 149) are
disabled on QCN6122 even though the board-2.bin BDF contains the
UNII-3 frequencies and the regulatory domain covers them. This also
truncates the wpa_supplicant freq_list, so a 5 GHz STA can never
scan or associate on those channels.

Clamp high_5ghz_chan to the standard 5.8 GHz upper bound (5825 MHz,
channel 165) for QCN6122, matching what the hardware and BDF
actually support.

Tested on a CMCC PZ-L8 (IPQ5018 + QCN6122) with the 5 GHz radio as
STA and AP on channel 149/HE80.

Patch authored by V4Pro (DeepSeek Harness), tested and submitted by
autumnshiu.

Signed-off-by: autumnshiu <autumnshiu@foxmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10172,6 +10172,15 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	reg_cap = &ar->ab->hal_reg_cap[ar->pdev_idx];
 	temp_reg_cap = reg_cap;
 
+	/* QCN6122 firmware omits the UNII-3 band (5725-5850 MHz, channels
+	 * 149-165) from high_5ghz_chan, which makes the driver mark those
+	 * channels IEEE80211_CHAN_DISABLED. Clamp it to the standard 5.8 GHz
+	 * upper bound so channels 149-165 remain usable.
+	 */
+	if (ar->ab->hw_rev == ATH11K_HW_QCN6122_HW10 &&
+	    reg_cap->high_5ghz_chan < 5825)
+		reg_cap->high_5ghz_chan = 5825;
+
 	if (supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		channels = kmemdup(ath11k_2ghz_channels,
 				   sizeof(ath11k_2ghz_channels),


