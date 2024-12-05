Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA5E7716C
	for <ath11k@archiver.kernel.org>; Thu,  5 Dec 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCjNRJrSktMlDO/Ks0uxEWXTnrnlOc73abdK3jrL0nE=; b=XcxC5HpqmVnBqrVrN0OV6Dizge
	l108AOGEBSXs6dh8V3G3xMMdUWHnyDla0ezA9APnfGjMHHcA2av95NBYwJ5xR9JUyDwCN1oeW+g1w
	BSDb330LNKUyBGo4K0yBO+JE+iVLmL9EG3dJKhRzyqhsInrbDMVoLzaxBGKsJ9ULXO1UxIvxXUFbp
	HgH23umb37W8btobNMQ6J7iOFZeUMJ0hPcXZTClEN4oaEm4AtZiwGKRU3B7YfJK1uQEqgQQrjz8Si
	8AzJrTAzRU+G8qlLtDmcMXlZt3N1wRoRUu3nBlWZyZ69LqWSVrfevM8y2h8lboG0kEm3oXBhSJk6y
	LY7b5kzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9hX-0000000FetI-1PFb;
	Thu, 05 Dec 2024 11:07:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9hU-0000000FesJ-3f2q
	for ath11k@lists.infradead.org;
	Thu, 05 Dec 2024 11:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733396834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCjNRJrSktMlDO/Ks0uxEWXTnrnlOc73abdK3jrL0nE=;
	b=XWVRBTXMQraEL/rTC+yniLdFOzFUrb183yEV7WKvwJkZtddVzmBXBlc/xl/t2Bbz1Mxqph
	lu/lfx1d0IMoSzpCb2ffkx0UkAoCWyiyK4svJCVt4fvAyh+hwXbndcbczZzCPeKh9KxYTM
	XuMvuSHrZBJutWAFhRsfJZrOLrbsaJ8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-5YFsSwcCNGO14L4FqOgbuQ-1; Thu,
 05 Dec 2024 06:07:11 -0500
X-MC-Unique: 5YFsSwcCNGO14L4FqOgbuQ-1
X-Mimecast-MFC-AGG-ID: 5YFsSwcCNGO14L4FqOgbuQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4ADB31956087;
	Thu,  5 Dec 2024 11:07:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.37])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3D6E3000197;
	Thu,  5 Dec 2024 11:07:05 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_yuzha@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_cjhuang@quicinc.com,
	vbenes@redhat.com
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations are supported
Date: Thu,  5 Dec 2024 12:07:02 +0100
Message-ID: <20241205110704.232725-1-jtornosm@redhat.com>
In-Reply-To: <f75a1655-fa5d-4675-85d0-b9b97dceba6f@quicinc.com>
References: <f75a1655-fa5d-4675-85d0-b9b97dceba6f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_030716_981643_2CC1A4DA 
X-CRM114-Status: GOOD (  10.99  )
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

> But I see your interfaces all be added with managed， right?
Yes

> Test steps:
> ...
Ok, I am using a bridge with the AP interfaces in addition but it is
the same.
Indeed I have tested in the same way as you too (even using your
hostapd.conf with the suitable name for the interfaces).
So I have started to debug (current upstream linux +
https://lore.kernel.org/all/20241127022742.4016870-1-quic_yuzha@quicinc.com/ +
dump_stack() in ath11k_mac_op_add_interface, enabling ath11k_dbg),
let me show you this:
[    5.703295] ath11k_pci 0000:01:00.0: vdev a2:d8:da:c5:7b:79 created, vdev_id 0
[    5.703304] CPU: 4 UID: 0 PID: 945 Comm: NetworkManager Tainted: G        W          6.12.0+ #104
[    5.703315] Tainted: [W]=WARN
[    5.703317] Hardware name: ASUS System Product Name/PRIME B660-PLUS D4, BIOS 1620 08/12/2022
[    5.703320] Call Trace:
[    5.703325]  <TASK>
[    5.703330]  dump_stack_lvl+0x5d/0x80
[    5.703344]  ath11k_mac_op_add_interface.cold+0x4ed/0xa92 [ath11k]
[    5.703399]  drv_add_interface+0x4f/0x230 [mac80211]
[    5.703512]  ieee80211_do_open+0x4b3/0x770 [mac80211]
[    5.703669]  ieee80211_open+0x8a/0x90 [mac80211]
...
[    5.804755] ath11k_pci 0000:01:00.0: vdev c8:94:02:b5:fe:fb created, vdev_id 1
[    5.804759] CPU: 1 UID: 0 PID: 1011 Comm: wpa_supplicant Tainted: G        W          6.12.0+ #104
[    5.804763] Tainted: [W]=WARN
[    5.804765] Hardware name: ASUS System Product Name/PRIME B660-PLUS D4, BIOS 1620 08/12/2022
[    5.804766] Call Trace:
[    5.804770]  <TASK>
[    5.804773]  dump_stack_lvl+0x5d/0x80
[    5.804783]  ath11k_mac_op_add_interface.cold+0x4ed/0xa92 [ath11k]
[    5.804809]  drv_add_interface+0x4f/0x230 [mac80211]
[    5.804868]  ieee80211_do_open+0x4b3/0x770 [mac80211]
[    5.804934]  nl80211_start_p2p_device+0x8b/0x160 [cfg80211]
...
So, since the normal sta interface and p2p interface are initialized,
with your proposed interface combination, only one AP interface can be
added for me (vdev limit is 3).
I like your idea to have a common interface combination set for everything,
but I think it is not possible here.
My patch with the new parameter at least allow to select what to do, dual
stations support or APs support for all the cases.

Thanks

Best regards
Jose Ignacio


