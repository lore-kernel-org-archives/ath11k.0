Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7887CDB487
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9GeQeCVqlnmDgvQYV9cS7N96CiAO9sQgUmVUmgB4ycM=; b=yBTne4YH3IxQ/K
	/orUDGhaUMB66t31y51iZPb1jlP2J0MFdOjAREKwyHp/T9ovHo0+wt2Hx1T4XEBO1gc6moH7XuWvM
	uejaxBHLWrd17bsJIBmPE4bMmYbho8vPF6DW7c9QY2m7Z1/En1yQXCeXEDjiw+qfFfVLy/ABoA50x
	tr51VV8I8b1jXFt1waLyG98QRgDRl/eRshDLkNWUBySdmiwXxp68oEZcs7GPl+x6zDK1NBXT510Fi
	cjTh66nn0tge2Y/h5dNw89/JkqbKm4Wa9jnVzKk5iuSct9wnxNOiC+vrYXYKER5uNpXO4N/6u9zJq
	MDTUjMuTFv3FL0rBuj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUk-00H3ti-2l;
	Thu, 19 Oct 2023 10:43:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQUh-00H3qE-27
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 10:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33A92B827A4;
	Thu, 19 Oct 2023 10:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AD0C433C7;
	Thu, 19 Oct 2023 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697712189;
	bh=iUSdV9CFZmw4yRgGQyhrpABX6aSvA+ch603XWDzFF6E=;
	h=From:To:Cc:Subject:Date:From;
	b=PB9JH2lKw92emWDbT8O4k989xfioIzTWSkvZC36EY8GmomzMrdlUwFj4um5PleG2z
	 hznwRuYuSvJ8T8+EIGqgVZtWx/AT2wJNhU/UfsRdFhuglbl1cxgoxKWSPmU6/k5Lko
	 6dTGH7Cn3kG8FsN1q9y5vSYfugN/ExifmxhFdGzrT4caXP3KXxixJz73kvD4Ni4OqO
	 29pbGcHEbRlBWiYkodZAbWHqSS6PJmFheaac1qMXj4DLI1HBV7SFkv/VlOkw6vY2ri
	 RmjMnDd7yN3zZTbcCL0ZOBK4eZ6cs0vCUS451hl7RqIFEvGv9L14kL+XG/MiNFAOWO
	 9CYL1/56G+zPA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtQUh-0003ak-2v;
	Thu, 19 Oct 2023 12:43:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] wifi: ath11k: fix event locking
Date: Thu, 19 Oct 2023 12:42:09 +0200
Message-ID: <20231019104211.13769-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_034311_846180_3EE5905C 
X-CRM114-Status: UNSURE (   5.15  )
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

RCU lockdep reported suspicious RCU usage when accessing the temperature
sensor. Inspection revealed that the DFS radar event code was also
missing the required RCU read-side critical section marking.

Johan


Johan Hovold (2):
  wifi: ath11k: fix temperature event locking
  wifi: ath11k: fix dfs radar event locking

 drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
