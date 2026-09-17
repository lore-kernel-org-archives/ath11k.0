Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E4C982C1
	for <ath11k@archiver.kernel.org>; Thu, 17 Sep 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTBRx/POh6sMNSgm0GJh52YtrZBru3mV1Q9aul2DNLU=; b=G6xmOrV19QsXbnbOh/7arLe7n1
	ypRFT6HVZTXI0LsWxZ/CKTymFWXmsU7Iq8tXHIbvQ9umyOFz772JEKrkYKpJiCnp0mDMmNLCu3tvB
	rHS7PPmGp2RKIsm6/Cly1G1PKeRp9fUoJ6U9ZhAfd2lQrQ6c8gN/A5kKamAzGTPyk4QRCdKCo7hts
	d82hBgWAutuvJgbDl/S2MRP544poe5yeyOLn5yrxP5ptTgt/YucMK3oXDHCMBzVh9ejYrIgRy8uEH
	c5QUl2AkYSCcr8nwP4MwCdx6hKTj2T9TGCYDsp3bAMxVA3y1NtC6fy52uNGV88TCg5Zeg/dLGuAMg
	k914gYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x765k-0000000AjgR-2gLP;
	Thu, 17 Sep 2026 06:59:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x765i-0000000Ajfq-14uE
	for ath11k@lists.infradead.org;
	Thu, 17 Sep 2026 06:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789628369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTBRx/POh6sMNSgm0GJh52YtrZBru3mV1Q9aul2DNLU=;
	b=gyG0ZS8h/sH3uwMRSzbwfIOKgvFnx5HNK0qd+Zq+IdfyyXYzJLdsAyyR2Bdb+xz+GhQh6t
	zfFhzAC5Y1byM7HZ1RmD5sh69x+Q8v5sMLe/ShLwGKud42rjEy3DWALHAspux7xdzXiQ9T
	3DRudZrDsf6Bv6BB/EvnBmVeEr5MG9Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-B3nzCZyuN6qmTGsSQWl-GQ-1; Thu,
 17 Sep 2026 02:59:26 -0400
X-MC-Unique: B3nzCZyuN6qmTGsSQWl-GQ-1
X-Mimecast-MFC-AGG-ID: B3nzCZyuN6qmTGsSQWl-GQ_1789628364
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CBC21954B13;
	Thu, 17 Sep 2026 06:59:24 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9524230001BE;
	Thu, 17 Sep 2026 06:59:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: helgaas@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Thu, 17 Sep 2026 08:59:18 +0200
Message-ID: <20260917065918.13357-1-jtornosm@redhat.com>
In-Reply-To: <20260915223634.GA878346@bhelgaas>
References: <20260915223634.GA878346@bhelgaas>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: kj2yZEIB32PDRow4H2t44A5yuu9HWDT1DbRZXCXiw3A_1789628364
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_235930_375139_0E48C422 
X-CRM114-Status: GOOD (  14.74  )
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

Hi Bjorn,

Thanks for the review.

> I guess you are saying that some kind of reset *does* work
> fine in normal, clean VM termination?  If reset works fine
> for normal VM termination but not for VM crash, do we have
> any idea why they are different?
It depends on the device:

- For the modems (SDX62/SDX65), without a proper reset
  capability, these devices never successfully initialize
  even on first VM assignment.

- For the WLAN devices (WCN6855/WCN7850), the reset fails
  in both cases, but on clean VM shutdown the guest driver's
  .shutdown/.remove callbacks properly deinitialize the device
  (stop DMA, disable interrupts, etc.), so it ends up in a
  known-good state even without a successful reset. On unclean
  termination (crash, force-off), the guest driver callbacks
  never run, the device stays in an undefined state, and
  without a working reset it cannot be reused.

I will try to clarify this better in the commit messages for v14.

> Since these basically copy code from other drivers, is there
> an opportunity to remove it from those drivers and use this
> instead?
Yes, that could be a follow-up after this lands.

> This looks like two patches squashed together.  If there's
> any other reason to touch this patch, I would split them
> apart.
Ok, I will split the WLAN and modem resets into separate
patches for v14.

Thanks

Best regards
Jose Ignacio


