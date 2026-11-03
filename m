Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB126082BE4
	for <ath11k@archiver.kernel.org>; Tue,  3 Nov 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gHMpNTok;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEKbJfYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8nIUAdKhQOdU5bD0Ebix2Rj1z+5vhf3MK7JazPI6O1M=; b=gHMpNTokQUk40To7uw5SM35Tzu
	jH8sAnPCtuSxNQVG0l7Rgyn+333vrpcRiri3UJ6y7BMIsTh7clNbQ1Zf5YsGJW3RxRKt8Ti8lRZ4n
	WGIfyM5NLCx92RzGJZlBqhNJNlJzXVgDc0fXztYbrNVFKG0Jjzd9xZEUK4lpbKY1AuySZ33GmZwdt
	G+2mC3/DLIX1hGSeuQPNifn+4vnF+ukuYj7kqkQ1LQBwJHKwpOvFz+ctHlBp4RiwcY3gea1Wi99IK
	/jgF8e/d6JTyiCLRKSyI5y8IhHBjCK5cvaoShnsM9etOGcParJOOjZQIQ9vSEU4F+4pOkwiawqRkh
	5GFeVAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBwy-000000022jI-1KMX;
	Tue, 03 Nov 2026 10:41:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBwx-000000022j0-3LNv
	for ath11k@lists.infradead.org;
	Tue, 03 Nov 2026 10:41:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E7E443266;
	Tue,  3 Nov 2026 10:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE49D1F00A02;
	Tue,  3 Nov 2026 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793702467;
	bh=8nIUAdKhQOdU5bD0Ebix2Rj1z+5vhf3MK7JazPI6O1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PEKbJfYv0gQXOfZZKZgDdS0Xx5ADDeTDUQg46LyAXCi0aBZAYa7GhmO8hOkC2p7dX
	 5C5O0j+rfTmjTlXSr7QRAbOfu66F7Zt5wmSxzn9iKBGyMF+cYY8EY908q3tScIltod
	 xbwED2+h5Nabfceq8hjmD8tX7hbXgGTQ6xpLjyhoQspuZOualCNlVQUGUJnlUAJgN7
	 wVgydqMcQrAUDYOyENhucAc1Yx18K84Rgxf/0Fb3YkNtl8vuuEz8Ni10yW72bdTZcP
	 xa1VYJMczhbO9NvGFetMUgUxMrSgYJX63gogW+TdRO017GJeoLBXlBkqF1UcNgPTlK
	 YRC2gUD2q8XPA==
Date: Tue, 3 Nov 2026 11:41:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
	stable@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: release the rproc reference on teardown
Message-ID: <20261103-complex-kickass-reindeer-f5a0fd@quoll>
References: <20261103102859.1340835-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103102859.1340835-1-vulab@iscas.ac.cn>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 10:28:59 +0000, Wentao Liang wrote:
> ath11k_core_get_rproc() looks up the target remoteproc with
> rproc_get_by_phandle(), which takes a device reference and a reference on
> the remoteproc driver's module.  The resulting pointer is stored in
> ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
> tears down the firmware resources, and the probe error paths after the
> lookup jump to err_core_free without dropping the reference either.
> rproc_shutdown() does not release it, it only drops the power reference.
> 
> Release the reference when the AHB resources are freed and on the probe
> error path, so that repeated bind/unbind cycles no longer accumulate
> remoteproc references and the remoteproc module can be unloaded again.
> 
> Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 



Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





