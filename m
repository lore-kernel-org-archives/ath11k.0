Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD470C05027
	for <ath11k@archiver.kernel.org>; Fri, 20 Jan 2023 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffIt8LGQXAF3Q1CGHTtwDLeT8F5ux1bqL4JCpwu8aaI=; b=WLrqW9Z+knYjrfqQSxyebB/2EC
	190/GeZYNYY6ogBLc0lx1lQlOlmubr8aw//6ZthasaXtioO1zRvZzVd+Oq+oOpoGckNWDcAg+2SNk
	A9VBTT9tJB2/yOfLOuBZ0eunonOMiLm6tCPZBjvChLP9SMRFOWtH3tnYiV9mXSpm2XFwBh6vOomDZ
	FEoYbIbWP0REygFKAyolSTo8rFU2FZQ0PD/vk3UBZbUGxV4PzBkT4Xex3K5RSrLw/haO5y+KCnnmi
	Gu3D6LKLeW5rIXSMP5J4aYf/SgwMbNLBdTcwOr+fJvxeKnO8UkNbveSPEs0yqhfV382SkF2XTcbl1
	LjPLtuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIuoi-00BP83-1L; Fri, 20 Jan 2023 17:04:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pItjh-00B6lX-1Y
	for ath11k@lists.infradead.org; Fri, 20 Jan 2023 15:55:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30F2961FC0;
	Fri, 20 Jan 2023 15:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458B8C433D2;
	Fri, 20 Jan 2023 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674230123;
	bh=qvm8DqBkaTHT07BZ556an1tEajb8dh7gFEoJgp6bbRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5jDRx6T6LkTemR9BtnDpiE6T6uAoeE+/u0Y/iRBggEzMri1MVkD0c8yginGVIIjD
	 qHRkwEmdYjFbp/X6w3DeQziph306hDuwgmidpTSwpMACOcdNmjJOgsNnTdWd6oHh1U
	 wSdTE8gpOVP/XFPYFxDQKZloMOSz8EUYOZApHHzIUfZWO7sAyQ/LIzYacPfB0lL1p0
	 M08OzyQto2R695PZrnFoZ0a9PWJqwjYTXffbsV9DzABOoH0cNRYwWm0mHoY4V6Jca5
	 V2GjZ5FQeskct6+TCqrz2L2VWDcfF23XoXKCbROLqZD6Fn6rFAyFNYjyszdQm5DAhM
	 IZvRdIjAWhCig==
Date: Fri, 20 Jan 2023 16:55:19 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
Message-ID: <Y8q5Z98S3pODD77W@lore-desk>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
MIME-Version: 1.0
In-Reply-To: <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_075525_205990_663A6761 
X-CRM114-Status: GOOD (  31.61  )
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
Content-Type: multipart/mixed; boundary="===============9182640801038824586=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============9182640801038824586==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yo7JkSdJuEIsiG7Q"
Content-Disposition: inline


--Yo7JkSdJuEIsiG7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 19/01/2023 15:02, Johannes Berg wrote:
> > On Mon, 2022-12-26 at 14:03 +0530, Rameshkumar Sundaram wrote:
> > > As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
> > > (BCCA) from AP and switch to new color, but some STAs aren't processi=
ng
> > > BCCA from AP and not doing color switch, causing them to drop data
> > > frames from AP post color change.
> > >=20
> > > Provide an option to disable color collision detection and therefore
> > > not to do BCCA to mitigate the same from AP. If it's required in case
> > > where STA supports BCCA handling, then it can enabled in AP using this
> > > option.
> > >=20
> >=20
> > You should probably split this into cfg80211 and mac80211.
> >=20
> > Also, this doesn't really seem to make a lot of _sense_ since nothing in
> > the kernel actually acts on detection of a color collision - hostapd is
> > acting on that.
> >=20
> > So since you can easily make hostapd ignore the event, why do you even
> > need this?
>=20
> This may not be related, but the software color collision detection sends=
 a
> netlink message for every colliding frame and it can hose up the system if
> the other network is very active.
>=20
> Also, cfg80211_bss_color_notify() complains that the wdev lock isn't held.

Hi Nicolas,

I agree, I think we can ratelimit netlink messages sent by the kernel to
userspace (e.g. to hostapd), I would say every 500ms is ok.
I guess we can move cfg80211_obss_color_collision_notify() in a dedicated
delayed_work so we can grab wdev mutex (cfg80211_obss_color_collision_notif=
y is
currently running in interrupt context).
To give an idea, what do you think about patch below? (please note it is ju=
st
compiled tested so far).

Regards,
Lorenzo

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index f5d43f42f6d8..0aefaca989aa 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4652,6 +4652,20 @@ void ieee80211_color_change_finalize_work(struct wor=
k_struct *work)
 	sdata_unlock(sdata);
 }
=20
+void ieee80211_color_collision_detection_work(struct work_struct *work)
+{
+	struct delayed_work *delayed_work =3D to_delayed_work(work);
+	struct ieee80211_link_data *link =3D
+		container_of(delayed_work, struct ieee80211_link_data,
+			     dfs_cac_timer_work);
+	struct ieee80211_sub_if_data *sdata =3D link->sdata;
+
+	sdata_lock(sdata);
+	cfg80211_obss_color_collision_notify(sdata->dev, link->color_bitmap,
+					     GFP_KERNEL);
+	sdata_unlock(sdata);
+}
+
 void ieee80211_color_change_finish(struct ieee80211_vif *vif)
 {
 	struct ieee80211_sub_if_data *sdata =3D vif_to_sdata(vif);
@@ -4666,11 +4680,21 @@ ieee80211_obss_color_collision_notify(struct ieee80=
211_vif *vif,
 				       u64 color_bitmap, gfp_t gfp)
 {
 	struct ieee80211_sub_if_data *sdata =3D vif_to_sdata(vif);
+	struct ieee80211_link_data *link =3D &sdata->deflink;
=20
 	if (sdata->vif.bss_conf.color_change_active || sdata->vif.bss_conf.csa_ac=
tive)
 		return;
=20
-	cfg80211_obss_color_collision_notify(sdata->dev, color_bitmap, gfp);
+	if (delayed_work_pending(&link->color_collision_detect_work))
+		return;
+
+	link->color_bitmap =3D color_bitmap;
+	/* queue the color collision detection event every 500 ms in order to
+	 * avoid sending too much netlink messages to userspace.
+	 */
+	ieee80211_queue_delayed_work(&sdata->local->hw,
+				     &link->color_collision_detect_work,
+				     msecs_to_jiffies(500)); /* 500 ms */
 }
 EXPORT_SYMBOL_GPL(ieee80211_obss_color_collision_notify);
=20
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index d16606e84e22..7ca9bde3c6d2 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -974,6 +974,8 @@ struct ieee80211_link_data {
 	struct cfg80211_chan_def csa_chandef;
=20
 	struct work_struct color_change_finalize_work;
+	struct delayed_work color_collision_detect_work;
+	u64 color_bitmap;
=20
 	/* context reservation -- protected with chanctx_mtx */
 	struct ieee80211_chanctx *reserved_chanctx;
@@ -1929,6 +1931,7 @@ int ieee80211_channel_switch(struct wiphy *wiphy, str=
uct net_device *dev,
=20
 /* color change handling */
 void ieee80211_color_change_finalize_work(struct work_struct *work);
+void ieee80211_color_collision_detection_work(struct work_struct *work);
=20
 /* interface handling */
 #define MAC80211_SUPPORTED_FEATURES_TX	(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M | \
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 23ed13f15067..1ef970b457d1 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -541,6 +541,7 @@ static void ieee80211_do_stop(struct ieee80211_sub_if_d=
ata *sdata, bool going_do
 	cancel_work_sync(&sdata->deflink.color_change_finalize_work);
=20
 	cancel_delayed_work_sync(&sdata->deflink.dfs_cac_timer_work);
+	cancel_delayed_work_sync(&sdata->deflink.color_collision_detect_work);
=20
 	if (sdata->wdev.cac_started) {
 		chandef =3D sdata->vif.bss_conf.chandef;
diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index d1f5a9f7c647..acab8309d2d6 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -39,6 +39,8 @@ void ieee80211_link_init(struct ieee80211_sub_if_data *sd=
ata,
 		  ieee80211_csa_finalize_work);
 	INIT_WORK(&link->color_change_finalize_work,
 		  ieee80211_color_change_finalize_work);
+	INIT_DELAYED_WORK(&link->color_collision_detect_work,
+			  ieee80211_color_collision_detection_work);
 	INIT_LIST_HEAD(&link->assigned_chanctx_list);
 	INIT_LIST_HEAD(&link->reserved_chanctx_list);
 	INIT_DELAYED_WORK(&link->dfs_cac_timer_work,

--Yo7JkSdJuEIsiG7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY8q5ZwAKCRA6cBh0uS2t
rCTLAQDgp2pVIY4trzeG7eSzEsaiNyMvPWLtKsyNyS6LJ229sgD9FfB12AhLJ0qk
I8BJCppf82H2IJp+FvwTYm+4o7u4rgA=
=16w5
-----END PGP SIGNATURE-----

--Yo7JkSdJuEIsiG7Q--


--===============9182640801038824586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============9182640801038824586==--

