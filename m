Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06308C54E58
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfFW5kCLFafWVBiNpJ5W+QaU+TMnoueVsQ3m1t2yNsk=; b=ZDBss39O3DBfs0jJTJx3gmgusC
	oUwzJg5dNoFZN0Tk2r95ZYP72+zeZgTENZK792cYEW4cK6Za50h8y/5+h+rOojyJ5Tyk5vJAUOyzw
	B32Mvy/m9PgqX0NuJBLDMGNV53ixhIpApTgS6eWwrLfHkRSILzW30CGPIeJxdxQrLZ+48H5eNnwDN
	6zu3oW84hMuxj68vaKT4LQ9UTPsU7Uu1WCLfRAIEPVXua4o24nDOe9oeaYyY/Dfj4cWLk4ffaaEyV
	9OpLAhOI68rzJeBXcjO1b0mLbf8TUi54QQQ91qSLpQF6gPBOFY4vX4p0fpyIKDO0w3lkbEpzIZyC8
	ud45cPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnNs2-00000004MOn-3vsV;
	Thu, 21 Mar 2024 19:14:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnNrz-00000004MOO-1tr4
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 19:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=NfFW5kCLFafWVBiNpJ5W+QaU+TMnoueVsQ3m1t2yNsk=;
	t=1711048471; x=1712258071; b=WlgeONcr+ljfR3PN6CBAbq9OJgxOS+1LBPlg+jG+KalWsj+
	ou+tJWkEO2IHSntqx25Q+46jJy1wlCST9TZRQC5CeiXPisHJ7Rqmvgz2LHTmeNl4io1fFCb3FYLdS
	vhZZATxdhn5qaoJ+FV9/0o2t/CA6ErnpYffwbJI2qEDEjRYjgOIFhp68Z2jWiSrO7XtFJBD5ZgYum
	M01CGtoELEpK91va9mGceUW9saoohy1U/IgBOdd35R893RcoVEGRi8mf7kMWyAT4j5+olpdyJ4oAt
	hM8YX5Ehqb8lopqd+BymavEtN9+aQWIagqAMpbicKCelyL8dDJBc15wsSxZyGNww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rnNrn-00000008deO-075c;
	Thu, 21 Mar 2024 20:14:19 +0100
Message-ID: <55125648b2553ce746b92092a009d4939d1eb6b8.camel@sipsolutions.net>
Subject: Re: ath11k and vfio-pci support
From: Johannes Berg <johannes@sipsolutions.net>
To: David Woodhouse <dwmw2@infradead.org>, Baochen Qiang
	 <quic_bqiang@quicinc.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Kalle Valo <kvalo@kernel.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, James Prestwood
	 <prestwoj@gmail.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, iommu@lists.linux.dev
Date: Thu, 21 Mar 2024 20:14:17 +0100
In-Reply-To: <57d20bd812ccf8d1a5815ad41b5dcea3925d4fe1.camel@infradead.org>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	 <8734v5zhol.fsf@kernel.org>
	 <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
	 <87r0ipcn7j.fsf@kernel.org>
	 <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
	 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
	 <87mstccmk6.fsf@kernel.org>
	 <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
	 <8734v4auc4.fsf@kernel.org>
	 <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
	 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
	 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
	 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
	 <87il3w7zjh.fsf@kernel.org>
	 <20240115104658.0b56bd35.alex.williamson@redhat.com>
	 <543d9d2f-e132-4fdb-8454-68595cd20515@quicinc.com>
	 <57d20bd812ccf8d1a5815ad41b5dcea3925d4fe1.camel@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_121431_573744_EF046F87 
X-CRM114-Status: GOOD (  19.17  )
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

Given the "ewww" patch to make a module parameter workaround for this:
https://lore.kernel.org/linux-wireless/20240321172402.346191-1-jtornosm@red=
hat.com/T/#u


On Tue, 2024-01-16 at 11:41 +0100, David Woodhouse wrote:
>=20
> How exactly is the content of this register then given back to the
> firmware? Is that communication snoopable by the VMM?

If I'm reading the code correctly, it's just a write to a register in a
memory mapped region, possibly in multiple locations (different queues
or something). Possibly indirect (see __ath11k_pcic_write32), but
someone would have to trace it or know the HW better to understand which
locations it's written to.

But yeah seems totally feasible to just translate that back in the VMM.

> > > Off hand I don't have a good solution for this, the hardware is
> > > essentially imposing a unique requirement for MSI programming that th=
e
> > > driver needs visibility of the physical MSI address and data.
> > >=20
>=20
> Strictly, the driver doesn't need visibility to the actual values used
> by the hardware. Another way of it looking at it would be to say that
> the driver programs the MSI through this non-standard method, it just
> needs the VMM to trap and handle that, just as the VMM does for the
> standard MSI table.=20

Indeed. Much better than having a module parameter.

> Which is what I thought we'd already seen on some Atheros devices.

It probably also affects ath12k, seems similar.

johannes

