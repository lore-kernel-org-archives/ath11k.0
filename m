Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1779DC369B2
	for <ath11k@archiver.kernel.org>; Mon, 14 Apr 2025 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=; b=F00BsfH3wLit0zSMMCATxFJalF
	CdW4elIvwY2cE07OcSxu36j49ccRvJSs3opNeDULKKM0/kZo5ZxaiIh1Ms0farqA1PzqHN04f+6H9
	Ly4+5cXik0a7PGv0OfaZtQS/VirneGIVjaR77n9ctnwzqeq1foyh2m38RZumNu8eZxmr5n0DCasJn
	zwoC+NM0pqMz6YykxFEBNEgaDyyFb6SEgtK2VymTd9mumyLoIYmG1ZgF7gt8MJygCNClUhGc74zBy
	SxQUBLWHgNfY1yVXsuAcZfXDpmtb5Dz3dHu77cQzHgH6BgWI+FacohXI/fhLafs4kzTAj+9kr2/n2
	DbLwyq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PD8-00000003Ene-0apn;
	Mon, 14 Apr 2025 19:11:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OnF-000000039YW-3q1L
	for ath11k@lists.infradead.org;
	Mon, 14 Apr 2025 18:44:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3031354f134so3322514a91.3
        for <ath11k@lists.infradead.org>; Mon, 14 Apr 2025 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744656269; x=1745261069; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=KNDb+73A5TzuqB4z0jvGdsjDjmmCbYFKmN1im6jhxImSRfVtn9d+V6WZtJ5AXTsp/Q
         ZiU1nrwTM/4jYiokNwLN/DUiFUK7t2BGJS/irKRmBDlmdd4hgNmNnju+/ZOeJWBaGa4J
         jbEE1LY77wrfSSe96otTWAsNDnz5NPBJs5y5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656269; x=1745261069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpSfHpLk4g82/Efaxxr4vcOeA7lwSVP0ZoulsVdeGLY=;
        b=QxOEtP2oiIlLUbgOd8mHgZLNemvjw7pcIZfCIzpWZ2Jptx3mAYVXD6wDTCeDTCOQJG
         G3NVJrOHN1iFKsiYpDm9t+dyaCdz+oIgHv42sux2jJ75vSXJ5mqnEXBvje1aZoB1UAjf
         QUugLeNOOAWr8H47ax5PMJJ27D5Ldy47L08QSRb5LNeMU+co86Tr3L2Gdm1jTKLKN+i5
         PKbRiiiev1Z3FrEP753NChsm2KbUYFSgAsdM178Ts/tYqogWblQXoy8uaWIl/80ZGhME
         82/BCa/OVcVAQlyWfFEN93noo7urB4bIQ5X6I9kbrlhxkAdPVKFjuGb5IWf3myXo4AAZ
         Kvrw==
X-Forwarded-Encrypted: i=1; AJvYcCVYCY1CwEWWATTSTPKjN0HsTP3QWoyAWA2+4P3yLYJNeauf04ikpZHaSJLoS5DSW32VTtAutQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaWRRoUGXIrXo3uyq5X5pEUa5h4FX4Fu9aiG7ngdcQwkfJ5k3b
	NKpTjrANi4jbqUpS4TNEsBFu3Wdsf5CeJGTF0/j+g14A4uIx5I7Udje8NkCivQ==
X-Gm-Gg: ASbGncuHBc8hszFSv9A4vYOjzU5KwYFjhZgl7n1i0MZTJVBrdQA9GpquHELE2vNqMC4
	pc4n144t4rHzIsgx7VJ11DRYXe5atSfRg1+UvNjE9eVgymIRD9zYQ3spY7O1pcxZBmB6+RCDmup
	/uT9FQscRQV0DVaXJMPohVzmiOC3vNRAeJO1dM05OhhOrgbyN5KJfvnQoPGzGpyqMb8l/5FoiqS
	uzo77ZJfngnLQpgMOi7Ur3N+P9c3K+SPw/aGGdpP0OWTrDEnRWqCnD/swtm0j9gM/Dwu48DPWZ6
	pXsMuKdoi0QNgDRECbN+C38iaF74CwS9afjAKl5Rqca3C/9cq8ZrMEvo0HQOCUkbVQXuG7mLZNm
	5wA==
X-Google-Smtp-Source: AGHT+IHRnGevNVFCEzzLtuARDY+GV3b1ySMboNdXjtt9nCxP859MMeYdEqvd7RpkkuyGR22MEOT6ZQ==
X-Received: by 2002:a17:90b:2752:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-308237ba788mr18304386a91.27.1744656268888;
        Mon, 14 Apr 2025 11:44:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cfd0:cb73:1c0:728a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-306df082327sm11386410a91.15.2025.04.14.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:44:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:44:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <Z_1XiNY2ujreEo69@google.com>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_114430_081679_77A1557A 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, Apr 14, 2025 at 10:26:01AM +0200, Thomas Weißschuh wrote:
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk().

Is this really true? Documentation/admin-guide/sysctl/kernel.rst still
has a section on kptr_restrict which talks about dmesg, CAP_SYSLOG, and
%pK, which sounds like it's intended. But I'm not highly familiar with
this space, so maybe I'm misreading something.

(I do see that commit a48849e2358e ("printk: clarify the documentation
for plain pointer printing") updated
Documentation/core-api/printk-formats.rst.)

In any case, even if the advice has changed, it seems (again, to an
outsider) a bit much to say it was "never" meant to be used through
printk().

Brian

