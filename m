Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D6606EE25
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+1R5SRo;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=m2j+tbF4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=; b=R+1R5SRo7cRGxDXaRpda4LW1uC
	qnkyxf/7Z3NQFUy4jkPEhcW2hPIYvDAgTPcIIJAtWQ0ojcXy4W/j214o7H9cFDb2HbwSIUWuqnM8r
	jQ2WbdKMABndYZJoJy4ZNfT88iIFG21J145E4TFIBzezyo+qQFfSnEqBcG5zZNxQo7L3At+NG8Tbd
	1po/HThSfuHLcP12CIJAHoWxvG5EFI2xx1MiQYyi/QQHCym4Azg4KGSWUXkAmTPzqNQNdOVqGL08P
	3Bd+AtCNt6Xxy177DEkgX7d8bRXrEjKH+GUqLz4TKyrl4UCafHzBwmPARzH/XgFBPFhQ2VNymlkXV
	QFyicZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lr-00000005zQn-01I0;
	Wed, 11 Nov 2026 08:06:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Ln-00000005zLH-1fyO
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c505186727fso208781166b.3
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384393; x=1794989193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=m2j+tbF4EPe1bAIP3bZmms91KixlFhMh8xHLQX/6aemBycKJ87DgWXTCMG3cpOLZ/U
         JH8XN6dVkpZ/VhjxC86kQc4NiORxVZgLkzyR53pImD32ryrLLIS5Y9erR3EzPAQbtCYW
         DbQJMHAp/BCw2JWfq3f///EDaOXEsxLrJN72eT8RQkcQdzxw0tW5kvxnFCoJax1/aOkb
         Sc/DqkTlAlLkCKEcdoM+qFlr5t99FRr+UZCAktLDKg9g+4yv5Q/TJpMj/RJAG8E+XvSU
         rUm25oKj7EcZUZcWzF57rb9fYwIMhjr38eLmMXkj3JN2XK6EZgovky0/bGl6VGg5q7Nj
         cKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384393; x=1794989193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=23INSxQpTnB1Yk/T6QvYWGxavfW5mfQtEXC/Lj2DsVBET+nW9a5uy/dsZCaZbRKeBH
         EurQLCfs45ZK01kNM8oso6owk/fvin6jYU11n9kJR/Mee2cUzYyKCOfx4RKzBmyXydG9
         5thMUOuMhzMd8f9IRPJvOepMhav1yqEmx63oqyfKwyr1RLwzfG3nTd7i+Y5mbus5gQy7
         E7MWv6Qc8KzUCplklC1Vx1Rjv+FioXLCrbPjQMdfFPMXwI+vq3ltNuDA11v7/THx1rvj
         NDkR8vRWWJFXoWylkTrpp+tdjHZEz9EwmjBPCDO9+SKpCZB7022uZouC2BHU1/ZFFiyo
         9UGA==
X-Forwarded-Encrypted: i=1; AL+hErE8UoQXSyQ24PTkqyTNC3ZffAH3WhbOshfjnx9BklFZjdhADtIeQBajPdTl3+aCv72eChJZ6KY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9IaurTlXVn7daMcwIQHpTXiicFJZ+pnBA4fq0PYSDcVZVZfnB9
	1P8BvZ3j+kDVVlsAfRcfAHg3EVR6GhwIuMPGaaoUJ0sBq2FvA3pjYwKzIPuIfav9QQ==
X-Gm-Gg: AYBFou3Y70xrT3GbBKugVbE7sgML38cvPNljfns67+enrmZVTQYS1AYjrGzpN6wYcya
	gp01YqfeF5YsjHBSBljWUNHeLMt2JkWvL6LtQMkVA91xO9K+yil3rOOKc8zENwmw/pBnj3SxISI
	V7n8aDx+NL+AJlDyAGk2GxWyc/p9XNPt88uYis+seoT1vqBo/CKoE5g+S184rR2MM7Qqy5ZuEHA
	vXYRE3JHwy+YDBW9MuY4r+OpLrPxJfu2q75dt9PSl7EqnsSNCrWWqPOhf/bkmp/rlwxUbb06C3Q
	hg4KmtMroWgEruS+LNziv71/vwc/EDT6Bp5GJIUtR36oyapUMX/XMaZ1F0DZKnBd08OTc5TichW
	JLPI5lKSAMtsQDqnoXGXBVlt9lPVO7PUHME4tGQYRiZAateC25FFsQ1lkohk96JEw5zc3Vk5C3k
	4ps0IUzrC/Fnfcp4VKhg/8NQGbSPJu40bUGLQCjMNLx6bnqVomYFuRDXdGnivPfrrGmVKG45yIx
	BI2fR5Txy9Hztq6CTcaZhOqR6j0uIuXbcg4kNrf1WITp3vDd82lARfYZ3Z/3AvHEvf65GAx/wrD
	2J08/qimF0woZcXazPaGdqKrrHCKakntf6eTBx00fJNSCKNC9s35rbW6zGKBEPVhGslsp2ccMtp
	/+Ah4NbgDe486+xV+c5HDp6fgJ1Fwl1EXB+PBQGO+zaf9r9+zsf+DX2zySggJrlTFe04aGaSnx0
	UofM+d5Uv88kRW0mu9+/elqk94q5jcJriFKOl0A2hoCFilt1CqoIELbVVck03trWjvX7z2ezElh
	v3d+QUV2w6vIDxh3Y2MteeEalSHn4rYhw4jXdG87qz/UkKnzaqZPftUOMY4R2MdueSejeAq5onL
	0ORYTFnf4+REVVzBCxc=
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c50668b84bemr120721666b.4.1794384393506;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] soc: qcom: qmi, ath11k, ath12k: take WLFW messages only from the firmware
Date: Wed, 11 Nov 2026 09:06:27 +0100
Message-ID: <20261111080630.244427-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000635_461780_BBDFCD67 
X-CRM114-Status: UNSURE (   7.66  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Any local process can open an AF_QIPCRTR socket, send datagrams to the
port of a kernel QMI client and publish a server through the QRTR name
service. The QMI helpers hand responses and indications to a client's
handlers whatever their sender, and ath11k and ath12k connect to any
WLFW server that a lookup reports, including one on the local node.
Both paths reach the REQUEST_MEM indication handlers, which free the DMA
memory that the running firmware writes into.

Patch 1 makes the QMI helpers take responses and indications only from
the servers a client looked up. Patches 2 and 3 make ath11k and ath12k
ignore WLFW servers on the local node, as the firmware serves WLFW from
its own node. Patch 1 does not depend on 2 and 3, which can go through
the ath tree.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (3):
  soc: qcom: qmi: Take responses and indications only from looked-up
    servers
  wifi: ath11k: ignore WLFW servers on the local node
  wifi: ath12k: ignore WLFW servers on the local node

 drivers/net/wireless/ath/ath11k/qmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c |  4 ++++
 drivers/soc/qcom/qmi_interface.c      | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.53.0


