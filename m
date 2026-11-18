Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E1606A33F
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wuFPIorr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=BX9CpRDj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZAvv1Z1NX/RN7EuLZj7pKh7A8i43+V6DfmfwNYrQhy0=; b=wuFPIorrgVmxFz
	hXywU8bmW9lpxKpIYzrVQzOGsvt9uTZoVrOnTPKoDlqOPkl2nEx744O/2248mJHq6DQRnbsEMwBCV
	T+eSWoJzsnl79+f6m4qyIT8OrF6FRTq1+urbgy04wJ76aLXcsE5F+14SQAfZq0ws+/OFQOaRnfcTJ
	1T3c3YUs4V3xw37ha7Rx02I663jXFui1homb1HhRbSkt3w6ysQ+FEfEreFcqsSPT4u2GoUMcL2Uuc
	IDRvdMPD82+2GfRZ1yBu2FWHnOgG1KFcNCQFPeAfvWdXbyZ27soKnuQlHdHbxcXyL9X0TkWFh01OL
	jGavM60Q4zdpK1jyESsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgCZ-000000091kZ-3Yx1;
	Wed, 18 Nov 2026 13:59:55 +0000
Received: from mail.fernandotapia.eu ([173.249.8.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgCW-000000091j8-3ziW
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 13:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fernandotapia.eu; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZAvv1Z1NX/RN7EuLZj7pKh7A8i43+V6DfmfwNYrQhy0=; b=BX9CpRDj2VP5q4JXdncdv5UnAw
	3TVsBQzxFehiV6VDbtbWbx6ObWH8ThRK1aPDOluBb2NUCiVCANm8+q2rwEqyVn6jIGr+wH2XRD1yd
	6c5/SxE4p8XLDW0JITCb8AkB7S6UFVerwKr9g1eiDW/nhkBf9FloZhXVsLe6CsJXX95Sgsai1puwD
	4DGPHX9xMhvWKaqWgYchrCkwzkw5+gJu/ab5NQQvvN6B5SbIlAeIJEpyfHg5ow4ZAdxgby+cBRug/
	7iys/FnlwRYV2GvIowewX57/9zZKWd+l0mRhpnUxEYXCXeAz6eTXCUs6IALrSMggS2Uu2Ew6cBbYg
	b+MAeMoA==;
Received: from [86.127.236.214] (helo=workbench.lan)
	by espabilao.fernandotapia.eu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <fernan.tapia@fernandotapia.eu>)
	id 1xTgCT-00000001CDh-0a9P;
	Wed, 18 Nov 2026 14:59:49 +0100
From: Fernando Tapia <fernan.tapia@fernandotapia.eu>
To: nico.escande@gmail.com,
	ath11k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	repk@triplefau.lt
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on the same pdev
Date: Wed, 18 Nov 2026 14:59:47 +0100
Message-ID: <20261118135947.24335-1-fernan.tapia@fernandotapia.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
References: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_055952_999397_BAE4E5AE 
X-CRM114-Status: UNSURE (   4.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 17, 2026 at 10:04 AM CET, Nicolas Escande wrote:
> Even worse, 4 patches in total:

Sorry, I missed those. Please drop this patch in favour of Remi's [1],
which does the same. The same check fixed the reboot on a Xiaomi AX3600
(IPQ8074, fw 02146).

[1] https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a3961795.1784792420.git.repk@triplefau.lt/

Fernando

