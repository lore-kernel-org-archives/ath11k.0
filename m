Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B55C433DB
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 12:50:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6592247F
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 12:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6592247F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=w1.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2FocjsB3ADEGfcGuTCx/Pn4DKwAw/mCEVKusM+5qyrc=; b=RmySN9rX5AbWddGjdDpixcBgT
	S9/dGdsnGSd2MTKd44VZBO0JFmacmM5GC+7kMDGa8xtNS4I15ROE7DgJe8SZZJo4YEYkzyxwv2pfZ
	ul/5HXJmLQhtiSsGuj+oiwK3O1SVGSNMFvf/kd1BnwdE4J5uvB3/x02Y6M1MZsmyl9GK+LUcOhTRt
	2Ec1S2kf8fReMIQkUzLIjHEv93Drwq/z/sDN9WvQQawmTt/PzfFDkp9HK2bL8yi45Dz5lQaIywky2
	a3Ba9dH4il0DStn6xsJHlbHemlNUSqcRNbll3O6x4OQ3k1D7xCuU2zdFJfGcsBOcP5I31d+MLSSut
	e+rkM0vKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks3ac-0002Bw-39; Wed, 23 Dec 2020 12:50:02 +0000
Received: from mail.w1.fi ([212.71.239.96] helo=li674-96.members.linode.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks3aZ-0002BB-EA
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 12:50:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by li674-96.members.linode.com (Postfix) with ESMTP id B6F4611C85;
 Wed, 23 Dec 2020 12:49:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at w1.fi
Received: from li674-96.members.linode.com ([127.0.0.1])
 by localhost (mail.w1.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgxBzmvx5dJ6; Wed, 23 Dec 2020 12:49:51 +0000 (UTC)
Received: by jm (sSMTP sendmail emulation); Wed, 23 Dec 2020 14:46:22 +0200
Date: Wed, 23 Dec 2020 14:46:22 +0200
From: Jouni Malinen <j@w1.fi>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap power
 save
Message-ID: <20201223124622.GA12620@w1.fi>
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 <871rilf2th.fsf@codeaurora.org>
 <dbaa655c3f15f800f73b7c19f2b1a054@codeaurora.org>
 <87eelr1oq9.fsf@codeaurora.org>
 <f6c148a3-73de-1481-5f63-2deecb599468@broadcom.com>
 <81ced18ac5b87a17cf31797cf91669bc@codeaurora.org>
 <87sg9rtugu.fsf@codeaurora.org>
 <60c779b7c17b8ea40c2bba08d8fca98e83581580.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60c779b7c17b8ea40c2bba08d8fca98e83581580.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_074959_600685_6C2963A8 
X-CRM114-Status: GOOD (  19.15  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org,
 Arend Van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Nov 06, 2020 at 11:41:06AM +0100, Johannes Berg wrote:
> I suspect that SET_POWERSAVE might be confusing.

Why? Isn't the use case here very similar to the existing station mode
use of power save even if the power saving mechanism is more of a vendor
specific extension that applies while there are no associated stations?

> Perhaps just with an attribute used in START_AP (and CHANGE_BEACON if
> needed) would be sufficient?

NL80211_CMD_START_AP with a new attribute (or even re-use of
NL80211_ATTR_PS_STATE) might work for a case where this does not need to
be changed dynamically during the lifetime of the BSS.
NL80211_CMD_SET_BEACON (which maps to the change_beacon() callback)
feels like something that is currently limited to Beacon data updates
with its use of struct cfg80211_beacon_data instead of struct
cfg80211_ap_settings..

That SET_BEACON name is still from the old NEW/SET/DEL_BEACON time.
Should that be renamed to NL80211_CMD_UPDATE_AP if we extend this to
changes that are not really targeting the Beacon frame payload itself?
And should the cfg80211_beacon_data argument be replaced with
cfg80211_ap_settings? It looks like we already have some struct
cfg80211_ap_settings values like inactivity_timeout and beacon_rate (and
maybe some HE parameters?) that one might want to update during the
lifetime of the BSS..

-- 
Jouni Malinen                                            PGP id EFC895FA

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
