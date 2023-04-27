Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85743C77B7E
	for <ath11k@archiver.kernel.org>; Thu, 27 Apr 2023 08:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+huDfpraChaxK4rTUut41KXZFIr4je9zDSr2zm1eIg=; b=hdSWa3PeNlZmPX
	CCS8cU+satv33Kep62R6CZe81QlS2d+HdEb5NjQX9wfrQI/69xSkiFRkoj+IKTmqeF+fEbGvvGIyS
	XFxUm2xoQJSJQBfO58M2A0yz+zy+R4aXXxBxBbD0e0PiXq8sFwJHwgUknQDB/kRQbGkHcl1ghgoR3
	Zo9Eco202Q/bU6EcHpwECfoAKH3PizL4L3InFLhET+uSFijUkB3+OmeYbCw1X6Sefhx9+YiFPrIvx
	DQFFLyCEl2gltIUF9quvGTM4iGlClcUtFEPTon6fZ28T2jTYZmqnoP4A5UEGhr7Tc5SnWBiqfT/0r
	XPxPPSTXkQ1cxmeDGLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prwlr-005nEP-22;
	Thu, 27 Apr 2023 08:14:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prwlo-005nDo-0q
	for ath11k@lists.infradead.org;
	Thu, 27 Apr 2023 08:14:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E89C8637B1;
	Thu, 27 Apr 2023 08:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CB0C433EF;
	Thu, 27 Apr 2023 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682583266;
	bh=+LHYB0sYWaFSs3sPC1o7x7SZX0M3xmiNs6aa7zLUrE4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RobXXTHtw4mF1N1taXMj3fApFuJruM49jiGKtK/M841vMC4hKq81KCjJFtmKo91nu
	 Jr2ED18m/xtO8Tz1+U3gEA5tZ18HpYAcZBjImpet/ohjgbKDU5+CWD/FcwUzHmyvDW
	 dJXcmn/QaH/zIS5HivkiFzckZaiI19IFHtkmTO7GQOoCHuEkQ+wpYTvoGo0ffyY/b3
	 j1p+ZI2fHtcmCesWeYtCIcB/cGYkprKdQb49jw8OGpDk1T1A0WoUrkTOZrOqfHJEPg
	 WI15VqXP0SjmuVjf/C/QaKCcpaVWQ1UJFFjckWL6W3IQCubeP890zKGJV4fJcE+3xw
	 FaO87TRNSB5LA==
From: Kalle Valo <kvalo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
	<87v8hiosci.fsf@kernel.org>
	<e05d4d4d33a2c50973d139752b4fcfad5dbdf056.camel@redhat.com>
Date: Thu, 27 Apr 2023 11:14:19 +0300
In-Reply-To: <e05d4d4d33a2c50973d139752b4fcfad5dbdf056.camel@redhat.com>
	(Paolo Abeni's message of "Thu, 27 Apr 2023 09:07:34 +0200")
Message-ID: <87y1mdspwk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_011428_359764_E48B232C 
X-CRM114-Status: GOOD (  19.40  )
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

Paolo Abeni <pabeni@redhat.com> writes:

> On Thu, 2023-04-27 at 07:35 +0300, Kalle Valo wrote:
>
>> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
>> 
>> > ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
>> > look the same as list_count_nodes(), so use the latter instead of hand
>> > writing it.
>> > 
>> > The first ones use list_for_each_entry() and the other list_for_each(), but
>> > they both count the number of nodes in the list.
>> > 
>> > While at it, also remove to prototypes of non-existent functions.
>> > Based on the names and prototypes, it is likely that they should be
>> > equivalent to list_count_nodes().
>> > 
>> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> > ---
>> > Un-tested
>> 
>> I'll run sanity tests on ath11k patches. I'll also add "Compile tested
>> only" to the commit log.
>> 
>> Oh, and ath11k patches go to ath tree, not net-next.
>
> Just for awareness, there are 2 additional patches apparently targeting
> net-next but being instead for the WiFi tree:
>
> https://lore.kernel.org/all/e77ed7f719787cb8836a93b6a6972f4147e40bc6.1682537509.git.christophe.jaillet@wanadoo.fr/
> https://lore.kernel.org/all/e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr/

Thanks, these are on our wireless patchwork so you can drop them on your
end:

https://patchwork.kernel.org/project/linux-wireless/patch/e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr/

https://patchwork.kernel.org/project/linux-wireless/patch/e77ed7f719787cb8836a93b6a6972f4147e40bc6.1682537509.git.christophe.jaillet@wanadoo.fr/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
