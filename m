Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A20C636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6L99zWdhtsirvK780INva9sZoSaP+pYeLTE3ExrIiU=; b=o+uwq5TvyosfJa
	2PObZzs+yQwWNMqygWsPn6hyX4FiiMR3fZ4JYUdCA6BaqkYld5xqhVxqfAC/ZMio/IsyIfSWrjmL1
	BOIbO+uQ+CEjy6mdPzwy2bjRCNyvYW+cTNEYC4gq1E/Xl8bER4LoLY/cGXPH4L5qnEjN+waxBkBl8
	iPAxhiM1noDUSTXMZvNI4bNCfJC+1dEVJvrcjK3T8bSPBYKPBk8Fmba9OdCdEV/ChcF9H1sTGcY1g
	V6Eyhrde3o5yAtV+GeplhUbiYxfwHZv47ODdOP2SHhD0XphETHCWb611iSW1zXMFC8cfodSoUO7j9
	TYLtE4YkJyMWVfSmfpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXvI-00EdHy-9K; Mon, 13 Feb 2023 12:27:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXvE-00EdGx-ED
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 12:27:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8694A60FF2;
	Mon, 13 Feb 2023 12:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBA7C433D2;
	Mon, 13 Feb 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291222;
	bh=Lbnpmnk2FiIXritFY8FG4TwnWR9C5gs7XyzYU2n5g1k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=F+WkbyIxRzV9Oeko9shNsjnhKR8U5W1KTKIxeVNIqUzYuQjQWLZBC1ItkL/AwUlGe
	 5bkNF/RV+3qsirGCuENHhNC5/ldNEY5c8rikxl22FAiXjSj1pjMdDMUTF/MjEKH1S6
	 iH3V12QJKvZIkCDq9mOjR3yL3A+Oh1nmQkE7e9Anto2hLxS+TAadGRaOaPBqvlXCLB
	 FJDh4XS+bJaM6Bm8n40Fl30ua2CjYVzzcmmSFrvHQWt8dlbtHYfF2vUgW3nbYxzms+
	 rMiRO6WM94dZzzlOAr7KHnJlVLZalXhjQZ36IVOLI8rkqYeEedc344pqbbJ9OnZTDS
	 jPQMU+7RQyUfQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: [bug report] wifi: ath11k: fix peer addition/deletion error on sta band migration
References: <Y+S+WDeZqeooMdiM@kili>
	<63e587fe.df0a0220.47373.9a06@mx.google.com>
Date: Mon, 13 Feb 2023 14:26:59 +0200
In-Reply-To: <63e587fe.df0a0220.47373.9a06@mx.google.com> (Christian Marangi's
	message of "Fri, 10 Feb 2023 00:55:41 +0100")
Message-ID: <87ttzpvjho.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042704_577113_11634BFF 
X-CRM114-Status: GOOD (  13.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Christian Marangi <ansuelsmth@gmail.com> writes:

> On Thu, Feb 09, 2023 at 12:35:20PM +0300, Dan Carpenter wrote:
>
>> Hello Christian Marangi,
>> 
>> The patch d673cb6fe6c0: "wifi: ath11k: fix peer addition/deletion
>> error on sta band migration" from Sep 22, 2022, leads to the
>> following Smatch static checker warning:
>> 
>> 	drivers/net/wireless/ath/ath11k/peer.c:396 ath11k_peer_create()
>> 	warn: sleeping in atomic context
>> 
>> drivers/net/wireless/ath/ath11k/peer.c
>>     370 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>>     371                        struct ieee80211_sta *sta, struct peer_create_params *param)
>>     372 {
>>     373         struct ath11k_peer *peer;
>>     374         struct ath11k_sta *arsta;
>>     375         int ret, fbret;
>>     376 
>>     377         lockdep_assert_held(&ar->conf_mutex);
>>     378 
>>     379         if (ar->num_peers > (ar->max_num_peers - 1)) {
>>     380                 ath11k_warn(ar->ab,
>>     381                             "failed to create peer due to insufficient peer entry resource in firmware\n");
>>     382                 return -ENOBUFS;
>>     383         }
>>     384 
>>     385         spin_lock_bh(&ar->ab->base_lock);
>>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> Holding a spin lock.
>> 
>>     386         peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
>>     387         if (peer) {
>>     388                 if (peer->vdev_id == param->vdev_id) {
>>     389                         spin_unlock_bh(&ar->ab->base_lock);
>>     390                         return -EINVAL;
>>     391                 }
>>     392 
>>     393                 /* Assume sta is transitioning to another band.
>>     394                  * Remove here the peer from rhash.
>>     395                  */
>> --> 396                 mutex_lock(&ar->ab->tbl_mtx_lock);
>>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> So we can't take a mutex.
>> 
>>     397                 ath11k_peer_rhash_delete(ar->ab, peer);
>>     398                 mutex_unlock(&ar->ab->tbl_mtx_lock);
>>     399         }
>>     400         spin_unlock_bh(&ar->ab->base_lock);
>>     401 
>>     402         ret = ath11k_wmi_send_peer_create_cmd(ar, param);
>
> thanks for the report. I send a patch to ath mailing list that should
> fix this bug!

Christian, thanks for the patch. For reference here's the patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20230209222622.1751-1-ansuelsmth@gmail.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
