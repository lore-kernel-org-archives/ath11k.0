Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F2C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EXJ+N586JQssjnPiMNEZZP9DaYfkb1SKKIjIbSnTyW4=; b=uTJhOPY6xvt43P
	x5j6CcwYgvu0hhqVYap3uSaqAtFxmBmwl1Cp3IHUBjItcRtjll5y9k5BM5HHYYZCozV3KqlfOmgPG
	uOOctgfwq97we4aU/TyBZH8dEoZ5v4uWIKfc38pU8ryk7jpNvVhpAqJmUVpiweKt+OhfJZZJLXRxf
	sNvokCeSf+UnaV1ntEGNmzeg521WJMMisG+9IZlFulckB/lhPRr7khvCQDxzpJHHw+K7HyknL+SZX
	y755YYeGc+SZ3zv++nU/4qkmYcHIZPO5I94cCvd9ppSAtszhwsLgz2Jwp08xMNsCxQdXu/RMP/aId
	gfzQzQm7t4TzLUQ12KGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnAx-0000000CBKB-0OEt;
	Thu, 13 Mar 2025 18:20:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslvG-0000000Bu8t-1ESq
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 17:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0664F5C6237;
	Thu, 13 Mar 2025 16:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EEDC4CEDD;
	Thu, 13 Mar 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741885241;
	bh=EXJ+N586JQssjnPiMNEZZP9DaYfkb1SKKIjIbSnTyW4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HLYiUOLAhys2tNUDg43JzjVkT5OLNJumHCaM11HBMEogUw3E6FGy14yuZq92QoILm
	 7Ee2uGorHbW1X1z18YQoawmbu8cZjSinqG5anNYFkTtkZEyEyD+7PXdwqrs8dL1t3V
	 JEQgov6oSVn3wfIUV+f8gvlqY/kjxDSxlACWGK/NtcSRClwgCf3rl/Eoj6L0WTJpjL
	 Q0+iN3fdGHl+6MLvhdYtrfUZBvQ8qJUFs4IDuEuU5Vrfn+R9lNaP6qypuFgHBMHo7X
	 XmRpeykE3+icblIB8GB9NlNvLMR/i6HI8HFSlU5e0NMIFl0Efrn4p2gZ2mGSVMndOA
	 XyQpzvcHWuZLQ==
Date: Thu, 13 Mar 2025 12:00:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
	quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
Message-ID: <20250313170039.GA738803@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100042_371516_013CC931 
X-CRM114-Status: UNSURE (   3.04  )
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

s/update/Update/ in subject to match others

