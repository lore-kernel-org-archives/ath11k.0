Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E17CD98CC
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuw0J3g45Skc3QfhRqB7uACn5uzzyF7cYO293roxvqI=; b=SUJAiofcejuXB9euxBO5hcL6qP
	pD2ckaWkzKI/4POYOzS4ura6ypcLqXwf0nDHjgevK87RrP2l6Kwr+8b2xka6OhUjCcOwv0pv1j6lb
	1t7ITvqPHUSMQ9N2MrAfZQ7DIJnJZ6l2CsgCkUB6szQgx8E/6BcBS+ubFhAf1UZBf1M0lkyibcEQM
	uTaprqr6NksBTbQJj71zfytabXm2SGDDagVFSk9z/2ogzNDNK0wLidmvW2sPPOZb1HJHJfOol3BaN
	MFKlICaYYFd75EctyVc2bsJvxB0LTktHVXKhMWcuCmNIdfgtNSE40ADTXOZfBUmaaIjjvd6RockWb
	M11vOqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZrh-00000008sWc-3Bud;
	Thu, 11 Jun 2026 07:30:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZre-00000008sVX-2nrP
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 07:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781163009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuw0J3g45Skc3QfhRqB7uACn5uzzyF7cYO293roxvqI=;
	b=JsvnUI9C7xzCKOhne7EdFUwf0iG+xEQ8mOexJRa1aOp78H65OKPvU++bXT6oeG5UfkJg+W
	H8/QkDab6/XrmdiNY/Ytrtt/0nCAsK61val96WBMeGqsbnSvIUw05t8MVv+80mUTKaNVYc
	fRe3lPeufvcwpbzZVpQQBopWDB5reLM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-kKtD1rzIMJGQH5L-LcWCpQ-1; Thu,
 11 Jun 2026 03:30:05 -0400
X-MC-Unique: kKtD1rzIMJGQH5L-LcWCpQ-1
X-Mimecast-MFC-AGG-ID: kKtD1rzIMJGQH5L-LcWCpQ_1781163004
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B36451800378;
	Thu, 11 Jun 2026 07:30:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.63])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C97B30001A1;
	Thu, 11 Jun 2026 07:29:57 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: alex@shazbot.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v8 2/3] PCI: Add device-specific reset for Qualcomm devices
Date: Thu, 11 Jun 2026 09:29:56 +0200
Message-ID: <20260611072956.22448-1-jtornosm@redhat.com>
In-Reply-To: <20260610131517.6d7bd63a@shazbot.org>
References: <20260610131517.6d7bd63a@shazbot.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: aQCYDH85OoVqevuP-422sheb0AO3UqM2TQ6A_QsGhxk_1781163004
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_003010_780021_B1F025C5 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Alex,

> This seems to suggest that the D3cold reset method is also untested...
> I'd suggest dropping the D3cold throughout, unless you can get someone
> to volunteer to test it. It seems like you really just want this quirk
> to do a D3hot regardless of NoSoftRst+ with a select set of devices
> where it appears to do more than nothing, where doing nothing is
> effectively what's left after the other reset methods are being quirked
> off for being worse than nothing.  Thanks,

Agreed, I don't have access to hardware with _PR3 support to install the
Qualcomm devices - all my testing for these has been on platforms without
_PR3 (desktop M.2 adapters).  
I'll drop the general d3cold infrastructure (patch 1/3) entirely and simplify
patch 2/3 to just a D3hot-only device-specific reset for the specific Qualcomm
devices where testing shows it works despite NoSoftRst+.
  
v9 coming soon.

Thanks,

Best regards
Jose Ignacio


