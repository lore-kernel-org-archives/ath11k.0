Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C0CE77180
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8AmzIEjYIQS6zN/bjVcHRxb12g3/9cjkDw7Uf+bRaw=; b=dTuIYGOGtU2vLn8QflwcsJ+x5h
	UyjRSTigW7hZ86zXQNuEOJXt8waHSveuog9Ipcm2qog+/P/PnIMjKzPcEcTjhEHmv1VrM6Cc98d0N
	k321sFhk8BSZt4NztjNSlHKhZBiMjniglqpzjxlJ3y1mn0E4TYz9axNDsbqcCDSbnLzRrH4stQThZ
	UJEWNAT7NvyjA5N7A/Jk2+cs+tA/7ImX4goBIhQ8ytCePWMbHxy05CD1pFay398wiG6Mgamrzluju
	lQ45GLiKPT3WrZmD7+ARhAv15ta7kN/Or2FH3csly6Rn+f06fC8MLotVQOnGYpkn47CIOYM9HYFQo
	GXvgasTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFV-00000001FnI-1ycH;
	Thu, 12 Dec 2024 17:45:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn3p-00000001CF3-0sll
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 17:33:14 +0000
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9FC7F20ACD6C;
	Thu, 12 Dec 2024 09:33:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FC7F20ACD6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1734024790;
	bh=j8AmzIEjYIQS6zN/bjVcHRxb12g3/9cjkDw7Uf+bRaw=;
	h=From:To:Cc:Subject:Date:From;
	b=gJT8tylMA9p8ykATh8M7TBp8bG7wrLTBVChrEcO+8CYjky2IreuL7Ww1JIgrqe0TJ
	 HmgK0Wa2KtnbepWHfjoD7K4cLnpv39lVLmv1GQD37mLACLyU2fd6TS/gCPPalZTK9Z
	 iCLN3g+6to3teWWxrd32CjLWy+LooyBdQ01pTIyQ=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH net-next v4 0/2] Converge on using secs_to_jiffies() in netdev
Date: Thu, 12 Dec 2024 17:33:00 +0000
Message-ID: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241211-netdev-converge-secs-to-jiffies-f18b18c775c1
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093313_278486_51E51B5D 
X-CRM114-Status: UNSURE (   4.28  )
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

These patches are pulled out from v2 [1] and v3 [2] of my series to be sent=
=0D
through netdev. The series converts users of msecs_to_jiffies() that need=0D
seconds-denominated timeouts to the new secs_to_jiffies() API in=0D
include/linux/jiffies.h to avoid the multiplication with 1000 or MSEC_PER_S=
EC.=0D
=0D
[1]: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v2-0-911fb=
7595e79@linux.microsoft.com=0D
[2]: https://lore.kernel.org/r/20241210-converge-secs-to-jiffies-v3-0-ddfef=
d7e9f2a@linux.microsoft.com=0D
=0D
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>=0D
---=0D
Easwar Hariharan (2):=0D
      gve: Convert timeouts to secs_to_jiffies()=0D
      wifi: ath11k: Convert timeouts to secs_to_jiffies()=0D
=0D
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 6 ++----=0D
 drivers/net/wireless/ath/ath11k/debugfs.c    | 2 +-=0D
 2 files changed, 3 insertions(+), 5 deletions(-)=0D
---=0D
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07=0D
change-id: 20241211-netdev-converge-secs-to-jiffies-f18b18c775c1=0D
=0D
Best regards,=0D
-- =0D
Easwar Hariharan <eahariha@linux.microsoft.com>=0D
=0D

