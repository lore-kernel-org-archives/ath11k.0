Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73784C54EBD
	for <ath11k@archiver.kernel.org>; Fri, 13 Jan 2023 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLCZnUegXcmhT7ecvTANQh/bbGinqHagGH0CIp6pgaw=; b=tmQxfuiymVwLyu
	UvTb1D5nNrfrIkW+ejdOpsz2OPgQBfZoCHUKc88UK13xPGqxEJXy7JKyivKqDpsKPuTdCjodwDUDx
	G7+HHLeoCiHfZV4D20yOYsfZbw/vK7V5pGyvCOnXhHP8GB23j9fNgsSVT9Wfp5lGqoXfXP7M51QWa
	O0/Yaltui293n7fWggxjTaw254sd9LdIfTMkAaKlkgiAi0usgoGXGt8dHq7MH3XqbAOtwE4aJYt2E
	z4aCsePztQbAkNWlDeSVRPjYTppv7V5b3rOrm+by3tyCRT/52MQwfyXWk0JTCQ949dk1aXTcf9Wgd
	oGj+pt5rP3H+nEjKUeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIxQ-002VRZ-K3; Fri, 13 Jan 2023 12:14:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIxN-002VQS-HH
	for ath11k@lists.infradead.org; Fri, 13 Jan 2023 12:14:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E122B82135;
	Fri, 13 Jan 2023 12:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D1FC433EF;
	Fri, 13 Jan 2023 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673612085;
	bh=YAoO+Byw1unrROhiBcYVj0kEzsOoVTbw5Y49ArPv5bY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PHuymldC+LboDEJcHh9DFgK4OZkao77NPNEzZ01qnNHdotw94NaiSXQI1JAsO7UBw
	 rG1OW8Hv82z2CmcWNNRn5rWfGRv/t1uPn4tstpTFE+5ZR81Xk6byqmUn9hLlv5oJWD
	 aEi10g+PQnGB9XnK0ilY+E6Xh9/8A7sKYLnYDFAWrUT4KrHEEhMRHe3FoeBEVx/WqQ
	 sCRsG0Wi2wM1GkcCmdbnd6TYi6O/F2N+mndqz3UUocjKbS/IVUSEQ65/gyZPV+pVXc
	 I84rac7nGzKYoXkGvAbpZUmf0qRw8V9Yhyi+yl3UiRuEtX+y/0MyM+uZEEsTUjvlZY
	 obnVjEQdIkcaw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
	<20221011072408.23731-3-quic_wgong@quicinc.com>
	<8735atg335.fsf@kernel.org>
	<cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
	<e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
	<7bcd1a12-fb60-98cd-1a29-f55efa8d1499@quicinc.com>
	<73908049-4a69-e65c-665b-97d068f1fef7@quicinc.com>
Date: Fri, 13 Jan 2023 14:14:41 +0200
In-Reply-To: <73908049-4a69-e65c-665b-97d068f1fef7@quicinc.com> (Wen Gong's
	message of "Fri, 13 Jan 2023 14:54:50 +0800")
Message-ID: <87k01qd426.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_041449_756781_2F4083CA 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> Should I change commit log with below explanation and send v4?

Please stop spamming the same question over and over, it's really
annoying. If I don't have time to look at something, spamming me won't
help, quite the opposite. It would be a lot better if you would help
with the other upstream related tasks we have, that way I might have
more time to look at your patches.

To answer your question I need to look at this patchset in detail and I
don't know when I'm able to do that. But at this moment I don't trust
this patchset is the right approach and I'm not willing to take it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
