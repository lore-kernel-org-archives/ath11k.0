Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A7E606A31E
	for <ath11k@archiver.kernel.org>; Tue, 24 Nov 2026 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YbimQ/Nc;
	dkim=pass (2048-bit key) header.d=schenkerlabs.com header.i=@schenkerlabs.com header.a=rsa-sha256 header.s=google header.b=be7/Mr9U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=; b=YbimQ/NclhliORXBeMiLiJNuAW
	kjx0X1ZvZfPqSiiLZ7LAZWim0wXHtss5tuwmPHRMH+Iz68VrVAnuqlbmjtuxVxqwvEDLStX2Pvjq1
	vp+eqWZLovm/ulHw6O/cHHq9hJE4K1mAaPUVEDyfNMxHQ4KR9UEbqC4cC2O8dlqI/hDxBM6BkkAol
	23hTExNDp9rsa851Z2Poxhzi+qYgvQvmiTVu/XIq2pV20kFNT3HbRHSsqcQaGRBZI1gBZduGIkfir
	f0aakUJZEp8j21CxM4PFO5FgxU0pvgIX5lxpQ2X5UD1Yajbw3Rs4zXH0sK1mshBc0VTlf8XmKqH7S
	YlyskUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrSA-00000006jlc-2j5j;
	Tue, 24 Nov 2026 14:25:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrS7-00000006jjR-3YLA
	for ath11k@lists.infradead.org;
	Tue, 24 Nov 2026 14:25:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so29659965e9.0
        for <ath11k@lists.infradead.org>; Tue, 24 Nov 2026 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schenkerlabs.com; s=google; t=1795530298; x=1796135098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=;
        b=be7/Mr9UzL+NhgGqnmo5k/ZBqtMn8jaCcrEkYq16EvroC0EL32/YZpTYeB/jBn+8f/
         BQMyOgxyKc4PutWeoueI6kPZJU/H0qSuct4/iX8QUoh/q21dSvD0DzBYOdhU1pFDOTFO
         CVKCXaPF4CLuj/Q/DhukZBAzVF+HzXmnEE8OirIBpBotnQNVweVUqRUIlOvEArawiees
         IcYzmyYPkygrNaudlwFB7kLHWEyStRmpy4s4fWLtdIvGU+BpZSAwmbJ6YQcYBslVF7EO
         G0qtqTWL5Rw6/q5ZCcX7uq3HI59WKW+4YiNC4i/y+P+/ZXwRpRjskwmPE9I/mkhOaBwD
         KACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530298; x=1796135098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCKrLkl5k99AJFpDDohI0CFzM+JQWzk+3RNc7Giamwc=;
        b=tgT1I6CljCMsvLRqnvXikICaB2MxhLLYmONwtf4y/aYOaqCmXwT2/aXcsg86WvDoni
         2dcrER4vxeERqqDU4LGu9pAmYafT9uVP1m8nXXqkg7S8PiVaB7sZBq+eLjjWZQIEbFXf
         kSCMzaNO9AlwMKCAgvrz3OkWiuYKAXEIihR6yQCR+5fZDNePd4XvRjVnI5VZf28EpbLA
         TRzCy4UGMa5TXaOTemSkMEGKMW0qFlSXYVSq/1/ToLZe2igKwkmJXtYRKsJMfoOyEGjE
         K8NPTwmq3QxT7D/IsHk1zv90wSj3Mv7yCbA4+6iMwaj2T3H5WQln9oVJXbUumF1rNARB
         5Xaw==
X-Forwarded-Encrypted: i=1; AL+hErFkiLfPM4Mh1EzPu5Qu0CW3kqwQG/0meClG0zpi99n8m1RNeePTq4E59UB5ANbppA7PxV2twfM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+KuW4DTjBbvzUsESaP5LSsFPEZpnm4nVqh3Yavx3yTFIbn+zsw
	7n9b64SS/45G8cP7HXrHt1WPpC7uxoSDlTFw/Dj/czuguNajtLlMI30WVJb49x8UanuOOdJO7/N
	kBl2M2A==
X-Gm-Gg: AZFdTZcwRadmgTs1MGUoVN1vKZM8IH9VsyYLVkMwHiaCTR3IzHQkwwhYx3kwzJkkLq0
	tpX7CUJfgomqGuXm8fgOTjdwyRnnnSh/EkpXE1kPxHh1magy3gpRt4gfjfLo/WyLMtIoDG625W/
	nru5haZiDgb57WRQB1YoTR47SdzfzvwE/CgL31tNTjB6cClzd1EduY9cVDGnBB2eHcuXdHb0X9h
	pFuhLx8PSRdABx116JbTxp2NBFbiP26wLGURIVIeFV2u7omxtLVO6qzTtQ0kCMrZW7xR/ryF6Ho
	pofkDXKtiYNSY202pG69EZn0PDgUh2RS+sXuTuf1dI+jwPJ94XycDou5Gtmp5rzVOiEYmdVmsWm
	Y4efp/1p8yOHWrrJbGEQAq07lPSDhryGR+dY+g9wE8S3/T8POgaldRXMRtuFZ8HEJotbWbPD0zQ
	HAtdq2YPCdI9M6MAPkVo/spnSFy6BCedfsrEI6Da+uO/dEsYLzkSYwJfjHDgqKWRPUjQofIOtUl
	VIa3Sly2BxxKDDj1LZGWFPb7lnMzxmOjhogpwXrPswsahVt/sCrD9ESK0EiH7XT7mi2M8pkpbtd
	/80HdlAQFE6JttLQesZvvA2TBIs93uWoeVweG66h80kNF1YmR9NQySSp1nKcI2x5LfvRBQ==
X-Received: by 2002:a05:600c:1d8c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb88820436mr306545315e9.35.1795530297416;
        Tue, 24 Nov 2026 06:24:57 -0800 (PST)
Received: from jbs-XPS-13-9310.sus.lan ([83.144.243.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm386718825e9.1.2026.11.24.06.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:56 -0800 (PST)
From: "Joerg Schenker (Schenker Labs)" <joerg@schenkerlabs.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: clamp survey noise floor on QCA6390
Date: Tue, 24 Nov 2026 15:24:38 +0100
Message-ID: <20261124142438.106847-1-joerg@schenkerlabs.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062459_936220_A390B9F7 
X-CRM114-Status: GOOD (  26.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCA6390 firmware reports channel noise floor values of -111 to -118 dBm
in the chan info and pdev bss chan info events. The driver passes them
unchanged to cfg80211 as the survey noise floor.

These values don't match the signal levels reported by the driver. For
management frames, ath11k_mgmt_rx_event() calculates the signal level as
rx_ev.snr + ATH11K_DEFAULT_NOISE_FLOOR (-95 dBm). User space calculates
the SNR of a scan result as signal level minus survey noise floor, so
with a noise floor of -116 dBm, the SNR is 21 dB higher than the SNR
reported by the firmware.

The values are also far below the real noise floor. On an AP received
at -88 dBm, the AP transmitted to the station at 6.5 Mbit/s (MCS 0), and
the station transmitted at 13 to 27 Mbit/s. A noise floor of -116 dBm
would mean an SNR of about 28 dB, which allows much higher rates.

wpa_supplicant uses the SNR to calculate the estimated throughput of
scan results, and roams within an ESS when another BSS has a higher
estimated throughput. In an ESS with many APs, the station repeatedly
roamed from an AP at -60 dBm to an AP at -90 dBm:

  Current BSS:  ... freq=5580 level=-59 snr=57 est_throughput=180001
  Selected BSS: ... freq=5180 level=-90 snr=26 est_throughput=263301
  Allow reassociation - selected BSS has better estimated throughput

The station roamed to that AP twice within 15 minutes. After the first
roam, the connection was lost after about 100 seconds because of beacon
loss.

Add a hw_params flag to clamp the survey noise floor to
ATH11K_DEFAULT_NOISE_FLOOR, and enable it for QCA6390. The noise floor
is still reported, so users that require it, such as hostapd ACS, keep
working. Other chips are not changed.

With this change, the distant AP, received at -88 to -90 dBm, gets an
SNR of 5 to 7 dB and an estimated throughput of 18 to 26 Mbit/s instead
of 263 Mbit/s. In a one hour test at the same desk, the station stayed
on an AP at about -68 dBm the whole time, with 0.2% ping loss. Directly
afterwards, with the unpatched driver, the station connected to the
distant AP at -89 dBm, with 53% ping loss, and the test had to be
stopped after three minutes.

The problem was analyzed and this patch was developed with the help of
an AI coding assistant (Claude Code, model claude-opus-5-5). The
assistant analyzed the debug logs and the driver code, and wrote the
code and this commit message. I reviewed the change and tested it on my
laptop as described above.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: 9de2ad43d46c ("ath11k: add hw_params entry for QCA6390")
Signed-off-by: Joerg Schenker (Schenker Labs) <joerg@schenkerlabs.com>
---
Notes:

- Only QCA6390 is changed because it is the only chip I could test. I
  don't know whether other chips (e.g. WCN6855) report similar values.
  If they do, the flag can be enabled for them, or the clamp could be
  made unconditional.

- The noise floor is clamped instead of not reported, because hostapd
  ACS ignores surveys without a noise floor (acs_survey_is_sufficient()).

- ATH11K_DEFAULT_NOISE_FLOOR is used as the limit because it is the
  noise floor that the driver already assumes for the signal level of
  management frames. It also matches the link rates observed above.

- The survey noise floor has been reported unchanged since the initial
  driver commit d5c65159f289, which supported only IPQ8074. The Fixes
  tag points to the commit that added QCA6390, because the problem was
  observed there and the change only affects QCA6390.

- I don't know what the chan info noise_floor value refers to in the
  firmware. If there is a known conversion to dBm, using it would be
  better than clamping.

- AI assistance: I asked the assistant to find out why my laptop's WiFi
  was unreliable in one office while it worked elsewhere. It collected
  and analyzed wpa_supplicant/NetworkManager debug logs and per-second
  link measurements, found the cause in the driver, and wrote the patch.
  Over several iterations we changed the approach: from not reporting
  the noise floor (would break hostapd ACS), to a generic clamp (would
  affect chips I can't test), to this QCA6390-only clamp.

 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 20 ++++++++++++++++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae2730..8ffdd0a8f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -306,6 +306,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cfr_support = false,
 		.cfr_num_stream_bufs = 0,
 		.cfr_stream_buf_size = 0,
+		.clamp_survey_noise_floor = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fb..ea66f26b7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -231,6 +231,7 @@ struct ath11k_hw_params {
 	bool cfr_support;
 	u32 cfr_num_stream_bufs;
 	u32 cfr_stream_buf_size;
+	bool clamp_survey_noise_floor;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df48..5db4ff346 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7970,6 +7970,22 @@ static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 	rcu_read_unlock();
 }
 
+/* The firmware of some chips reports channel noise floor values far below
+ * the actual noise floor, e.g. -111 to -118 dBm on QCA6390. Signal levels
+ * of received management frames are calculated as rx_ev.snr +
+ * ATH11K_DEFAULT_NOISE_FLOOR in ath11k_mgmt_rx_event(), so user space
+ * calculates a far too high SNR for scan results from such a noise floor.
+ * On these chips, don't report noise floor values below
+ * ATH11K_DEFAULT_NOISE_FLOOR.
+ */
+static s8 ath11k_wmi_survey_noise_floor(struct ath11k_base *ab, s32 noise_floor)
+{
+	if (ab->hw_params.clamp_survey_noise_floor)
+		return max_t(s32, noise_floor, ATH11K_DEFAULT_NOISE_FLOOR);
+
+	return noise_floor;
+}
+
 static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_chan_info_event ch_info_ev = {};
@@ -8032,7 +8048,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 	if (ch_info_ev.cmd_flags == WMI_CHAN_INFO_START_RESP) {
 		survey = &ar->survey[idx];
 		memset(survey, 0, sizeof(*survey));
-		survey->noise = ch_info_ev.noise_floor;
+		survey->noise = ath11k_wmi_survey_noise_floor(ab, ch_info_ev.noise_floor);
 		survey->filled = SURVEY_INFO_NOISE_DBM | SURVEY_INFO_TIME |
 				 SURVEY_INFO_TIME_BUSY;
 		survey->time = div_u64(ch_info_ev.cycle_count, cc_freq_hz);
@@ -8099,7 +8115,7 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	survey = &ar->survey[idx];
 
-	survey->noise     = bss_ch_info_ev.noise_floor;
+	survey->noise     = ath11k_wmi_survey_noise_floor(ab, bss_ch_info_ev.noise_floor);
 	survey->time      = div_u64(total, cc_freq_hz);
 	survey->time_busy = div_u64(busy, cc_freq_hz);
 	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
-- 
2.53.0


