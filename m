Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6CDC982D8
	for <ath11k@archiver.kernel.org>; Fri, 18 Sep 2026 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b5bv1z8GDsA/z+8sSO5FQpNdMBCC5lJWTJBBHIy7h0=; b=A3wj1gJKlnmXgubylQJI+nHiHq
	jGsNbkShzj7ReG8XYXAvZt4V87TqeAkwmrixp1Q/oKwMtyIYmTdtvlBXgRgzijBnO1Hd/W7J76xHr
	DNIXAha9yXoElsRBFbWG4x3i3ZAaNuz8NNOB3UwVsChh0qLyLXrsBxE1o8cHE5/mvcaHIQZJq24km
	AobUARrZUaAvvLMOgDP5CpdG2C0e41pCTJi2UJ4+steGs0VlW8eMAD5whVbchOy8Djj1D7VESNV99
	d1tJobDM9YTsOd6Lehc4E72QmKzCyLpWwHBTvHtTlUshr4MYiCz2VZRsvcPVgallUK5X4gQdk4sWR
	6KusW2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S60-0000000DZhl-1Qtm;
	Fri, 18 Sep 2026 06:29:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S5y-0000000DZhK-0eKF
	for ath11k@lists.infradead.org;
	Fri, 18 Sep 2026 06:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789712952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4b5bv1z8GDsA/z+8sSO5FQpNdMBCC5lJWTJBBHIy7h0=;
	b=ZB7roJ9sld1LNY6RGsI7EikGxfAG1ZswBxbCCB9k/WI2MB13/uelJtyZ3tKU08IZM9BrRv
	5io8Hvvhmyw58uEB4sea2RvQqovMMFJ6OBxrPKTs2S4iwfbG053LGHd/No45TpLf/QIMep
	MN0Nacr9aTf097nv4VHfvpv6iGQP3rQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-cOgYg1zCMzW2m3hJUs0LyQ-1; Fri,
 18 Sep 2026 02:29:10 -0400
X-MC-Unique: cOgYg1zCMzW2m3hJUs0LyQ-1
X-Mimecast-MFC-AGG-ID: cOgYg1zCMzW2m3hJUs0LyQ_1789712948
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4150C1955D76;
	Fri, 18 Sep 2026 06:29:07 +0000 (UTC)
Received: from fedora.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D9A6118004D4;
	Fri, 18 Sep 2026 06:29:02 +0000 (UTC)
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
Date: Fri, 18 Sep 2026 08:29:01 +0200
Message-ID: <20260918062901.7578-1-jtornosm@redhat.com>
In-Reply-To: <20260917170642.GA1026691@bhelgaas>
References: <20260917170642.GA1026691@bhelgaas>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: eqvoXIRL1BwLf_SycBkbaz6qZtv044IIz15UQq5OdK0_1789712948
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_232914_266783_57CA56A5 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

> Ah, so this depends on the previous VM tenant to clean up
> after itself instead of the host kernel enforcing the
> isolation?

That is actually the current situation without this patch, there is no
working reset method, and since it depends on the previous status, the
host cannot enforce isolation at all.

This patch adds a hardware reset that the host uses on every device
reassignment (device-specific reset is position #1 in the reset hierarchy),
regardless of how the previous VM terminated. It improves isolation by
giving the host a real reset mechanism where none exists today.

The clean/unclean distinction was only explaining why things happen to work
today without a reset in some cases, not a limitation of the proposed reset.

Thanks

Best regards
Jose Ignacio


