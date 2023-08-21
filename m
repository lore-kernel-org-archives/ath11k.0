Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44219EE49A0
	for <ath11k@archiver.kernel.org>; Mon, 21 Aug 2023 05:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uqHAvdDvaiD+NlEOpofJVjLKX57DqGqSK/rMyjZBMg=; b=GvFctP8zmszR4V
	yoF314X+B7E9qfaZPp9VFsDMdMLKlj0GSTK66B/JJfyMDXJrBz03bMNILuem9hOCeH8VRZUXNbWvF
	0u9PJy/1iNgTGLw2Sza58ftdrqnVh9VUfdqSNLfSzCnRlDG8+8ipieffS/hvDCoxGslBB6LkDBYMn
	CE11ZHcMMtCbTNED2uj+LjmWgXwX+116qbuPdLYGFK4ZryNGmJAO4saTQ8p4kA28wAvMAU47nbRQy
	L8CFd++CNdlBC9CuWK0rl2s70RP4Tey13oc8eiobUdreAngVUZmP/kIkJ+mepW4X92SPjm+qTGOp/
	O3lOMzuT5iH9V7Z50bFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXx3b-00D8Fh-06;
	Mon, 21 Aug 2023 05:02:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXx3Y-00D8Ew-0J
	for ath11k@lists.infradead.org;
	Mon, 21 Aug 2023 05:02:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01E5F621BA;
	Mon, 21 Aug 2023 05:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBBDC433C7;
	Mon, 21 Aug 2023 05:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692594142;
	bh=/n3hR5EYT3KBFmLwBg1A5O09p9o/K88PJFEoXgWvlvk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uhqtSgTEGCMi0cDV7OxE56LMj9UAbkte1OuhFDuMc0g5++q8Uf3fHQQcKR2CofiGg
	 u94JM9fWCOpqK2CTmVq3z0z1f/28d2Qb9m8m9UbD856x1lRHTjZA1OqguxMaMS2Vwx
	 n3foqpmQFCxFdQEe/HdKrskG/o+IoeapGcEjCJ1gtUa9pYKS6FzFhdZ4odHfL/wRsa
	 /LgljvaGKiJr+2Pdr6bzv+gfbAut43FIHFb4X2ZjF0CuplgBYUy3xT4E0aQl5K9OCt
	 bv0bcTnoHvIv+SQPNm6p7qlNJPrZ7RKzIDQ8DWTD/dAHnMF/UirvZr5pGiF+R2cPvi
	 pu8x9D06RDO3g==
From: Kalle Valo <kvalo@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  =?utf-8?Q?Fran=C3=A7ois?=
 Armand
 <fanf42@gmail.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux ath11k
 <ath11k@lists.infradead.org>,  Linux Bluetooth
 <linux-bluetooth@vger.kernel.org>
Subject: Re: Fwd: Qualcomm NFA725A on T14s AMD Gen3: Bluetooth: hci0: Failed
 to send headers (or body or access otp area)
References: <a669d2d5-fee8-5841-eb5f-b7d047d3cdb2@gmail.com>
Date: Mon, 21 Aug 2023 08:02:18 +0300
In-Reply-To: <a669d2d5-fee8-5841-eb5f-b7d047d3cdb2@gmail.com> (Bagas Sanjaya's
	message of "Fri, 18 Aug 2023 17:16:17 +0700")
Message-ID: <87il99j8dh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_220224_202622_7A39C85F 
X-CRM114-Status: GOOD (  14.21  )
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> I notice a bug report on Bugzilla [1]. Quoting from it:
>
>> Hello,
>> 
>> (Sorry by advance if it's not the correct place to discuss that, but
>> I tried other place like my distro kernel forum
>> (https://bbs.archlinux.org/viewtopic.php?id=286929), interactive
>> chat, etc and nobody was able to help).
>> 
>> [1] == Short summary ==
>> 
>> I have a lenovo T14S AMD Gen 3 with a *Qualcomm NFA725A* Wi-Fi card
>> (which is actually reported by lspci as QCNFA765) and bluetooth
>> never worked on it, failing to load the rampatch with "failed to
>> send header" or "failed to send body" or "Failed to access otp area
>> (-71)".
>> 
>> Other people reports bluetooth as working
>> (https://wiki.archlinux.org/title/Lenovo_ThinkPad_T14s_(AMD)_Gen_3)
>> and a work friend has a T16 AMD gen1 which seems to have exactly the
>> same chipset and work flowlessly. So perhaps it's an hardware issue,
>> but I don't know how to qualify it if so.
>> 
>> => How can this be further qualified/debuged/workarounded?
>> 
>> Any help, even RTFM pointing to corresponding manuals would be very
>> much appreciated.

This looks like a bluetooth bug so not related to ath11k (which is a
Wi-Fi driver).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
