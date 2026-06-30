Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC29C43602
	for <ath11k@archiver.kernel.org>; Tue, 30 Jun 2026 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aaA+j96ATu54kIfRUjrZHWPEKT1weTYWyrrAFERnVw=; b=Lsodnl459HUv+BdPtFz3gikfj+
	bmnRyAtvpEPktrIg5oR2NJGOmkcEX94SUW8qA1hU5CAiOl5FJ6r/dPuTcf7qC+BzeoZLGH/YBO5wV
	6+1LvOLnIC4g6JNlGB5qL5zBYVgjqM0kjVCv+pBk9Fig+J2W6TUQUjuHA6KHN68eWGAMMDR/4nFpL
	/nAJxsHNpsnBAYenGBO4hAW/W9KHkvLE0iKFZEtsqulD11+TW9SZV1wpM3+qu4JIWHy1CuJL5r4dq
	3NfSgVLlGut40GhS2wDkla4KeVpKTopKlzrftwfuJS4evjOFJ2yv3WHSpnXT49s5DHhXz1DVGKIWZ
	zHFsNe6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRyF-0000000Fw9u-3jtA;
	Tue, 30 Jun 2026 06:29:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRyD-0000000Fw9G-0GJa
	for ath11k@lists.infradead.org;
	Tue, 30 Jun 2026 06:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782800958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aaA+j96ATu54kIfRUjrZHWPEKT1weTYWyrrAFERnVw=;
	b=KVz8nBiCXpmavcEPUQwZAAUcLmDPBmT8YjM0aqzhqe/+gzoK3BEG+6riNCaPb5AhKOCeSd
	xEd+em+9gu+949pZkUOGxj5EIej5HSTaqLuIRaviDcdGrW7xvpOHWFPp/YHMdoBe7G5VB1
	RDfKmmapz9iC+ZWOMPDfPeRTYpoF3Mw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-WG2wTwo0Meu3YKrqxdSpYQ-1; Tue,
 30 Jun 2026 02:29:14 -0400
X-MC-Unique: WG2wTwo0Meu3YKrqxdSpYQ-1
X-Mimecast-MFC-AGG-ID: WG2wTwo0Meu3YKrqxdSpYQ_1782800953
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED91C19774F5;
	Tue, 30 Jun 2026 06:29:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D3743000B4D;
	Tue, 30 Jun 2026 06:29:05 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 30 Jun 2026 08:29:04 +0200
Message-ID: <20260630062904.197939-1-jtornosm@redhat.com>
In-Reply-To: <5mrwcurlf6xnqla5x5idpt7ug34nv2eqpijnjmccgdwazrmwyv@64tixxe4aa57>
References: <5mrwcurlf6xnqla5x5idpt7ug34nv2eqpijnjmccgdwazrmwyv@64tixxe4aa57>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QRDphjCqVo9a3blnB8K_vGgLFrJ7UMoKGpX4JkAGVWQ_1782800953
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232921_172663_6C654184 
X-CRM114-Status: UNSURE (   4.48  )
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

Hi Mani,

No worries! v12 with the fix and WLAN renaming is on the way.
Thanks for catching it and your help

Best regards
Jose Ignacio


