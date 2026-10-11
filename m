Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B963ECA9EC7
	for <ath11k@archiver.kernel.org>; Sun, 11 Oct 2026 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEcJ/pFItgtT4/Uq84V4nCOcw5lFpC5TWp8hGwZydFE=; b=R/T19ct7CbKvAAth+6ZdrWWd0c
	Fd9GZTykGJ34lTTmoHBE+BxXeS+Zw137Gu0ncaXbkWJbdW75FC1d/nTKlg6/zMY/ToWQ8zhrm8KLg
	ld+pwsp0mXvxSpXakyHZvThvLLlPlo79IqFuxo+mgnNmlA0xANgUfV6H6Z3Szz04pkNS2H1zUbQpW
	dLXA/UjaWkDZU6uoKRQ0yckSYpZ6zQ/CGWg5n8rB5c5h3Rvo4nr5z5iS8NrROyWMwE0NJ/QcWlnn5
	uqDdLcQV1dpV6uEYkwSQtzsF3yGn2oTS6VDS1cKO5W4CyBuDuSEgP9Rylv5XVA3/tdNIpbIfD4Bul
	xES0y7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoOI-00000008puk-00l9;
	Sun, 11 Oct 2026 07:54:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoOF-00000008pu7-2Dml
	for ath11k@lists.infradead.org;
	Sun, 11 Oct 2026 07:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791705278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEcJ/pFItgtT4/Uq84V4nCOcw5lFpC5TWp8hGwZydFE=;
	b=bG/iRlHznXC2rDxgo8uasdx8f/p+RQJJP73H6esDuVgo/gt4eh415v30WxogCoXALyExbx
	hhgiwfpynDFk/jNe26jZiIgk7MW3AAVVqlDOsRjLw6Cy82ez5RDFBsgvLE86TjWuAzc5TA
	1c4s2l2K1Z2Kiui2WCiSDYoQu6gc+WA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-76GULbi8MJqa5ia54w_hFw-1; Sun,
 11 Oct 2026 07:54:33 +0000
X-MC-Unique: 76GULbi8MJqa5ia54w_hFw-1
X-Mimecast-MFC-AGG-ID: 76GULbi8MJqa5ia54w_hFw_1791705271
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0F31800A7F;
	Sun, 11 Oct 2026 07:54:31 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FEC8472;
	Sun, 11 Oct 2026 07:54:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca,
	alex@shazbot.org,
	bhelgaas@google.com,
	jjohnson@kernel.org
Cc: jtornosm@redhat.com,
	johannes@sipsolutions.net,
	mani@kernel.org,
	yishaih@nvidia.com,
	skolothumtho@nvidia.com,
	kevin.tian@intel.com,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Sun, 11 Oct 2026 09:54:25 +0200
Message-ID: <20261011075425.516927-1-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: Hlm-c1fi4fjgpnLXmf_ShXLZ7LIigh9IXvsZsfsReuQ_1791705271
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_005439_641245_FD733068 
X-CRM114-Status: UNSURE (   4.26  )
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

Hi,

Since no further feedback was received after the last discussion,
I proceeded with v2 addressing review findings (Sashiko):
https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

I remain open to suggestions and happy to iterate further if needed
to get this acceptable.

Thanks

Best regards
Jose Ignacio


