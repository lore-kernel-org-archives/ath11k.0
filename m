Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7748AC3DA79
	for <ath11k@archiver.kernel.org>; Mon, 15 Jan 2024 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wa17+crlsPrpTtPM/bWsnoOfURri5ucSyKPwfWoNOA=; b=AABH9Ud0mHouuYA/bMdrX5MQhS
	tzNWeCCB+SjWsZBzqT8udYJ+ESVZBdZYm3bbdgoP5w0dD6lBaYXHFGgdiPIccQrG9ST6T1MUtaqOP
	JsBAi5QrFsIGv0hEk7q9WZAtEhjDwfiVIiwbHoWwO6hJfNMlEGvVj/6myq2V3+r/CEyZiW1SBXKNA
	vvTuHe6RfoHCKoJkfAfLFkQFAwY3SJ4R/CWRfRu2v6U7FfxrhG0/bg2Fvsikwz5RO7Vy4NY91bUeU
	D8U0GsezDiv0qH02ejnIQt+95gGTYB+AQUOd2Baw2f2wbXcQ2BJP3at0W6LQoo3ClT3CtUkes5IQ7
	sDmov7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKKH-008b4D-1i;
	Mon, 15 Jan 2024 10:36:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKKE-008b3u-2I
	for ath11k@lists.infradead.org;
	Mon, 15 Jan 2024 10:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=0wa17+crlsPrpTtPM/bWsnoOfURri5ucSyKPwfWoNOA=;
	t=1705314974; x=1706524574; b=p0fopxZ583P1f5BBV/Bob+cDMG+uy+PilyxCGfk9+KItIKq
	jFsClDUOFza5DQKg4Akrjd5l/vcxdSbheL7G7cySCJeXKhKHJYz3AkypPuWEZuxLu9QxTfQW4SjSm
	VeOhxqnUed6kci08S9ySd+w0YMe55ya9D/9k7sMX1yT5oJmUQ45WZrallZIrlcChMlWLMf5qqPMJN
	a0nBKk3cGBpfbvFIWsCYe+aXeqR/THTtbWhSltmH858JdUVD+1E3ty0OEZqwbUzDWwN8KkJE/vx+l
	MnKn3CF+70cqRg90Y3845xD2+MBFw6KyDkdVydwqNyV+rqxcf0cXGfIOA3zzQgkg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1rPKKC-00000003PIh-3HZv;
	Mon, 15 Jan 2024 11:36:12 +0100
Message-ID: <ef5ea65e80aa0eb8d73d37505a26d2dbc32c2e0f.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath11k: rely on mac80211 debugfs handling for vif
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, lenb@kernel.org,
 ath11k@lists.infradead.org
Date: Mon, 15 Jan 2024 11:36:11 +0100
In-Reply-To: <87a5pb9cxp.fsf@kernel.org>
References: <20240111170629.1257217-1-benjamin@sipsolutions.net>
	 <877ckfip1g.fsf@kernel.org> <87a5pb9cxp.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_023614_744653_A60C3998 
X-CRM114-Status: GOOD (  15.25  )
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

On Fri, 2024-01-12 at 10:24 +0200, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
>=20
> > benjamin@sipsolutions.net=C2=A0writes:
> >=20
> > > From: Benjamin Berg <benjamin.berg@intel.com>
> > >=20
> > > mac80211 started to delete debugfs entries in certain cases,
> > > causing a
> > > conflict between ath11k also trying to delete them later on. Fix
> > > this by
> > > relying on mac80211 to delete the entries when appropriate and
> > > adding
> > > them from the vif_add_debugfs handler.
> > >=20
> > > Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs
> > > entries as appropriate")
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D218364
> > > Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
> >=20
> > Adding ath11k list so that the whole team sees this.
>=20
> Thanks, this patch passes my ath11k tests and I don't see crashes
> anymore. But what about other drivers, can we trust that they don't
> have
> similar problems? I'm just wondering should we consider reverting the
> mac80211 commit for the time being?

Good question.

I did have a look originally and I just went over all drivers (i.e.
debugfs_remove calls). None of these seem to be vif related. As such, I
would say we could just go ahead with this patch and leave in the fix.

That said, we could also revert 0a3d898ee9a8 for now. I don't think
that has any severe side effects other than a warning from debugfs
reappearing again for iwlwifi.

Benjamin

