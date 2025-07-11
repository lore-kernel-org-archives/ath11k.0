Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B12DC8303C
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXIy/RVj2bBm6hTsI9QXfi/v/gd79blbsgrN3X6v/pI=; b=ivJFnDj2XMv1z+I9olp+SvikJz
	hSKriC5G1UuDexI8uY2KuRt5/P+2BsZDurW0j0xn6otJuwApqjX0nS8TeY7EvQrW/lZ5FMpiMewgw
	mLtF4Fgj4nqCDUniGtMeYm6Y3eenzLNAOJcKrZlPElinqxShdTcZs8Up8vvpEzIeVDwBaws4Fik9d
	yKHfVrCZ3PIuVl2kc7hQVngwcLEKeL8Dt2bEXYc+ZxPoIOY1BMSoi68tfFP2vJmxBRresXto1ASgq
	+/ehNAWvIQzKVxCfTzty6XZ+oULTiNYnlz2zGUdkEwY07I+MLe1nw11JSZfjJYw+Z1D6zo2P0prE0
	FgYRr+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAfD-0000000ERPX-3iot;
	Fri, 11 Jul 2025 10:07:31 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9x0-0000000EI0j-0Gq5
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 09:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752225710; x=1783761710;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ne44bbTYibQEKk06zvdeZXV0JGbJvTKjbOlOl+PFBzk=;
  b=hXr3MUKnn4E6CaapLIuY1vBFZdCtj40omCxrW+hs7Zfj4SOsCbh7WGV7
   LeR5DQMrCTvHq1O8kUapX2wIxBd0sp8WFWVOH9lNDh24dEtOifj113ytb
   BUu3xhW8l4q0yvtIivbatjl7jElI5P2PZx271bDChqYGmyBs3VrHnNyXz
   XNoe6LEPfxKSYvXmFU0xWnX93WXk2+0x8w2jQ/66ucN+YqlEy3DX8sY1P
   6savKDbGwOEcZ5JPOQWGqNlkfklqoMEP9mQQ1ARR5w92NPUjp3BQCCnJC
   8qZ041OjJYFlQjcQEW0frQQOTQvd7M9m/xOTi3YLqvvTWTu7YdisUiwN1
   g==;
X-CSE-ConnectionGUID: BjySJgzfRUCbpK8a2/3iAA==
X-CSE-MsgGUID: rtkySXb8QdyYBDmEFx0RPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79956158"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="79956158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:21:46 -0700
X-CSE-ConnectionGUID: PvcNX0ouT4iYz06C15Oy9w==
X-CSE-MsgGUID: xk3fq7z+Tg23rwGF7zV5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="160872671"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:21:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Jul 2025 12:21:36 +0300 (EEST)
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
In-Reply-To: <irnkdlrmlozp7joydgnawfuivl2nnuxsb2t4osgxzbtyrfzd3n@7dhzjcd42aiw>
Message-ID: <c7d4288d-4d0e-a3c2-83d2-c3f1b282d4ac@linux.intel.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com> <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com> <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2> <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
 <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com> <irnkdlrmlozp7joydgnawfuivl2nnuxsb2t4osgxzbtyrfzd3n@7dhzjcd42aiw>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1361302077-1752225289=:933"
Content-ID: <0e71b6ef-a263-4169-3869-f785789a47fb@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_022150_120389_9E7F93A1 
X-CRM114-Status: GOOD (  42.79  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1361302077-1752225289=:933
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6c0bed1f-8dc1-cb12-cf09-a337d07698de@linux.intel.com>

On Fri, 11 Jul 2025, Manivannan Sadhasivam wrote:

> On Wed, Jul 09, 2025 at 06:01:22PM GMT, Krishna Chaitanya Chundru wrote:
> >=20
> >=20
> > On 7/9/2025 2:40 PM, Ilpo J=E4rvinen wrote:
> > > On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:
> > >=20
> > > > On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru w=
rote:
> > > > > ASPM states are not being enabled back with pci_enable_link_state=
() when
> > > > > they are disabled by pci_disable_link_state(). This is because of=
 the
> > > > > aspm_disable flag is not getting cleared in pci_enable_link_state=
(), this
> > > > > flag is being properly cleared when ASPM is controlled by sysfs.
> > > > >=20
> > > >=20
> > > > A comment in pcie_config_aspm_link() says:
> > > >=20
> > > >   /* Enable only the states that were not explicitly disabled */
> > > >=20
> > > > But the function is called from both aspm_attr_store_common() and
> > > > __pci_enable_link_state(). So I don't know if this is behavior is i=
ntentional
> > > > or wrong.
> > >=20
> > > Hi,
> > >=20
> > > I think it's intentional. Whether the behavior is useful is another g=
ood
> > > question but the current behavior aligns with the explanation in the
> > > comment.
> > >=20
> > > My understanding of the situation is:
> > >=20
> > > pci_disable_link_state() and pci_enable_link_state() are not symmetri=
c
> > > despite the names, never have been (this is one of those many quirks =
ASPM
> > > driver has which should be eventually cleaned up, IMO).
> > >=20
> > > It might be appropriate to rename pci_enable_link_state() to
> > > pci_set_default_link_state() to match the name to its functionality (=
and
> > > the function comment):
> > >=20
> > >   * pci_enable_link_state - Clear and set the default device link sta=
te
> > >=20
> > > Note: "the default ... link state".
> > >=20
> > >=20
> > > I've already raised this concern earlier! As you see, my comment are
> > > not getting addressed. I'd like to see the author does one of these:
> >
> > I replied to your comment on v3 patch[1], and I feel instead of having
> > new function() we can use same API to our purpose.

It's not about what "feels" something. One should clearly write down why
such conversion is correct/acceptable when it comes to existing callers=20
if changing an existing API. The note should be such that it remains a=20
permanent record for future (in the changelog).

I don't have answer to what are the expectations or intent of the existing=
=20
callers. Convincing a patch is fine is responsibility of the one who is=20
submitting the patch, not reviewer's.

Unfortunately, it is usually quite hard to figure out for existing drivers=
=20
we're not familiar with. I'm not saying your "feel" is necessarily wrong,=
=20
but the existing callers need to be properly investigated if you choose=20
that path, not just handwaved over. It likely boils down if the=20
->aspm_default and controlling it are useful features to have in the ASPM=
=20
driver as your patch would take away that ability.

> You replied to Ilpo, but never got an agreement. Please try to close the
> discussions before posting next rev. If reviewers forgot to reply to your=
 query,
> feel free to ping them in the same thread itself.
>
> > > 1) Renames pci_enable_link_state() to pci_set_default_link_state()
> > >=20
> > > 1b) If pci_enable_link_state() is still needed after that, a new func=
tion
> > > is added to symmetrically pair with pci_disable_link_state().
> > >=20
> > > or alternatively,
> > >=20
> > > 2) Changelog justifies very clearly why this change is okay with the
> > > existing callers. (And obviously the function comment should be alter=
ed to
> > > match the functionality in that case too).
> > >=20
> > > If approach 2 is chosen, it should be very carefully reviewed when it
> > > comes to the callers.
> > >=20
> > I am in favor of approach 2 which you suggested, but lets wait for othe=
r
> > reviewers feedback on this. Based up on the response i will make
> > necessary changes in v5.
> >=20
>=20
> I would go for (1). It is always going to be a problem to change a legacy=
 API
> like this. We might end up causing regressions. So it is safe to rename t=
o
> reflect the purpose and try to come up with a new API that does what you =
want.
> If callers want to migrate to the new API, they can also do it in the fut=
ure.

That's my recommendation as well.

--=20
 i.
--8323328-1361302077-1752225289=:933--

