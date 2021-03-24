Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE049C433E0
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F165619C8
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F165619C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YZ26XQ+tUi0ubnf2s4YwtsyybA4wFWhAloQVPwcFshs=; b=VaukBEtQPpGhhYo/USuwnu3I3
	hdonbpxhgaBMnKSg13rfC7kscctDL1Rf5+5Rg+hrhO48EaNgfN3mRjoF4icaXlaOeyzyC0qXAsriv
	lt27uYZozsd4psMITFZGpCOLl2uyQFoQ8yT2t6XDst918zQPJPsRnvvef/0+TKItFhY3Rjg1Ms3NP
	EaZLE2OrgNrGBwzQFDW31d++g3oiwfHC7cYJUQfZO2ZlhWB7fPFfGlI9VYzAW8XOOLYMI4dufHnH6
	+vpMEgsx6i8L3JVZ8z4in4JfKOkveiymVIDEtzYz/zi6oyJuXO5s8YdcvReXBsrFMS0ubz6GoP09E
	fkJPQEJQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRFsF-0045PY-Kx; Tue, 30 Mar 2021 15:01:43 +0000
Received: from namei.org ([65.99.196.166] helo=mail.namei.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPAVT-000Ccc-8y; Wed, 24 Mar 2021 20:53:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.namei.org (Postfix) with ESMTPS id 507624E1;
 Wed, 24 Mar 2021 20:50:33 +0000 (UTC)
Date: Thu, 25 Mar 2021 07:50:33 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>, 
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>, 
 x86@kernel.org, Ning Sun <ning.sun@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>, 
 James Smart <james.smart@broadcom.com>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>, 
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org, 
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org, 
 linux-security-module@vger.kernel.org, 
 "Eric W. Biederman" <ebiederm@xmission.com>, 
 Christian Brauner <christian.brauner@ubuntu.com>, 
 Kees Cook <keescook@chromium.org>, Miklos Szeredi <mszeredi@redhat.com>, 
 Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
In-Reply-To: <20210322160253.4032422-4-arnd@kernel.org>
Message-ID: <b8ebab59-1cec-42d-6fb9-44aa1a464ae2@namei.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1665246916-699807841-1616619033=:3443171"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_205335_634676_D62D75E1 
X-CRM114-Status: GOOD (  13.99  )
X-Mailman-Approved-At: Tue, 30 Mar 2021 16:01:41 +0100
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

--1665246916-699807841-1616619033=:3443171
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Mar 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-11 introdces a harmless warning for cap_inode_getsecurity:
> 
> security/commoncap.c: In function ‘cap_inode_getsecurity’:
> security/commoncap.c:440:33: error: ‘memcpy’ reading 16 bytes from a region of size 0 [-Werror=stringop-overread]
>   440 |                                 memcpy(&nscap->data, &cap->data, sizeof(__le32) * 2 * VFS_CAP_U32);
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The problem here is that tmpbuf is initialized to NULL, so gcc assumes
> it is not accessible unless it gets set by vfs_getxattr_alloc().  This is
> a legitimate warning as far as I can tell, but the code is correct since
> it correctly handles the error when that function fails.
> 
> Add a separate NULL check to tell gcc about it as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git fixes-v5.12

-- 
James Morris
<jmorris@namei.org>

--1665246916-699807841-1616619033=:3443171
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--1665246916-699807841-1616619033=:3443171--

