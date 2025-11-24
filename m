Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B1CFD313
	for <ath11k@archiver.kernel.org>; Mon, 24 Nov 2025 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hu3rqTOV07Z4uALBxeFw7U3onLp/b7eW48Jo3HeMsvE=; b=KEn9OD/Otn3XLHxSHHv3UDCgiX
	SP+6xb+ctCD5ejj3lRX6PhGXi7uR+ChtlTVO3NvRxlCDisjLuEB/XEPXzpxGMHJym02ZsGw83vl50
	7dwCZ1UCyL3tZVYUzgZKH6H84R3iOWVs6pNE2w3sCrzyafqJudaU3Nt39A1frdRfgyLzJv1wpEQOd
	vAUbbHwcPRbWx0A0B8UErKL2h9RxZjzoPm09wZ194YkYxEfcL8Iq/TZn523n8P+xbzJ+Drw4rSjqw
	zJ2h7JS/eNGMVAfE1KyXIwABCaj4KgnLKZNiO8nkZVO1N/5vU3RUFYcTGcdwVFkrFh8l8gkannTw/
	CAK2HNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWuc-0000000BmLo-1GO1;
	Mon, 24 Nov 2025 13:47:26 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWua-0000000BmKv-14NS
	for ath11k@lists.infradead.org;
	Mon, 24 Nov 2025 13:47:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFF9D5BFB3;
	Mon, 24 Nov 2025 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763992041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hu3rqTOV07Z4uALBxeFw7U3onLp/b7eW48Jo3HeMsvE=;
	b=0CaxQpM02koMa5b4PS1OekRH+mdROL3buPHnI0wApeUO7COvsn2XvpXEu9NunmwRq6Xzu+
	vSwC34XbS89P6lbwzjCYZ09FgKjzoIIUmwpX1NWn5D6mndOyXRjfPcr/kZ/qnJtmZORluB
	IZUoZBK2l3ylj2MjHVtOPzBwRtioWnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763992041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hu3rqTOV07Z4uALBxeFw7U3onLp/b7eW48Jo3HeMsvE=;
	b=FfQkaUVnRTyzjRFi2bpKXRgD+XpMBgmueWB+K9wpezt/ZbrJPcW8YiRI8HEcxI3c3+kzDh
	2UgfbgPJVwIyeBBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="kPHLtjK/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9v2W0yf5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763992040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hu3rqTOV07Z4uALBxeFw7U3onLp/b7eW48Jo3HeMsvE=;
	b=kPHLtjK/OezWf9oFgPin8xQdOJOAn6/XMAMGbTgqdEmusc37ErWsR3AZuiCd6j1gL9zctY
	DmKdaBSsnTF4gb5GShDgUwVJEoz8298yfVYRZt7YkzeDTOMbrZaHsZVpZaYkmD5XTxhD9+
	Hi+/Vg0SBxqF4McN2pf/IC+evsDugeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763992040;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hu3rqTOV07Z4uALBxeFw7U3onLp/b7eW48Jo3HeMsvE=;
	b=9v2W0yf5XlillUk5K3j+mkEApXQNh0gMHNN527hvJMtDPmPM2gJTTewMseYHL7UnFjXKKp
	v2izazYKm0M7fLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5F1F3EA63;
	Mon, 24 Nov 2025 13:47:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tUNFJ+hhJGmAaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 13:47:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
Date: Mon, 24 Nov 2025 14:47:12 +0100
Message-ID: <20251124134713.5819-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CFF9D5BFB3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_054724_435846_8A468317 
X-CRM114-Status: GOOD (  11.18  )
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

The recent kernels showed a regression wrt suspend/resume on Lenovo
Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
long time sleep.  The only workaround was to unload/reload the driver
(or reboot).

It seems that this model also requires the similar quirk with
ATH11K_PM_WOW which has been done for other Thinkpad models.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1254181
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm not sure whether this model has another DMI entry, so put Mark to
Cc.

Also, I wonder which Thinkpad models are rather the ones that should
*not* take the quirk.  Since mine is Gen 3 and I already see Gen 2
entries, which else remaining...?


 drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8..3aa78a39394b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -924,6 +924,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* T14s G3 AMD */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
+		},
+	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
 		.matches = { /* T14 G4 AMD #1 */
-- 
2.52.0


