Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352BFC77B78
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4+3zJvHb2aI8pMMAxuxxajslcUlsmEd8uyQYxhoEq0=; b=tLw8jxr2Ti+R/z
	HdT245HeMl1MUegwDZVop3Qu7rix34Lixnfuby7oTeY9AkusPbq21QHtLwqAMQjBo8nX2D7fzLr0O
	epGcrxsfTQCjw8JA90novB36Fp2jXp0Y6SsTiUtFh1rtLdOYKh0XD+JVoeysNqpasS9HRYNS703ig
	xGWIFuCxuZAA9jtDpzYd9ZZ2tYUuJMxK4bdtlOMb+w8MDhItaLtOEJuTREhCZvrJ6QX5YoCh3G7Bo
	QmXASfZ/oaZUdvmO5qecT4sF2r7OG0ARqyZX7NbBZyBLHfzq9O7UHBPw3OJE6/6WMt/CQGMeUEfmK
	RLwQJ3/pd6U9zTxVWwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgMw-004ERK-2L;
	Wed, 26 Apr 2023 14:43:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgMt-004EQr-1u
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 14:43:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CB4662EF8;
	Wed, 26 Apr 2023 14:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AAFC433D2;
	Wed, 26 Apr 2023 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682520218;
	bh=L2Vzdv6hOho6TXdQfHRywvuKJkSdfA/V0BiA3MIf7Mc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HQW/MxDfsTK4+daANmC4qmkyDQh+XE/cJsU3UMrv4tUXe2UGgmRwSknPRPQX/UyK1
	 IpzqEzflOQPjaHmxl4wk10rDjrsLLlXEP3XuDVVKYXqWEv08O3HplxM9RdBWtehlvZ
	 UfxyZms3RPSk2MbFgLN2HqUwDzijkZhFYBEoUdWG8JLPMcWFQP9v8liyrx9TUClx/o
	 J2LtTaFi8AAvKLtezoK8s2JiILRZbG4aOhpzvc1gJs4rY+h/918Q4JwtUoiBCzLn09
	 HIm0rBwmFoFyez4ZEgStMygu7HGvy17mb/mbJkP9yz8TcQ4HPrl5Vf9o96TobiSzgq
	 paxw110Brz+xw==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/4] wifi: ath11k: remove unused function
 ath11k_tm_event_wmi
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230420120840.18712-2-quic_rajkbhag@quicinc.com>
References: <20230420120840.18712-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Govindaraj Saminathan <quic_gsaminat@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168252021295.23116.4251638014405306608.kvalo@kernel.org>
Date: Wed, 26 Apr 2023 14:43:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_074339_666479_6177A7AB 
X-CRM114-Status: UNSURE (   8.65  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> 
> The function ath11k_tm_event_wmi() is only defined and it is not used
> anywhere. Hence remove unused function ath11k_tm_event_wmi().
> 
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Please wait I'll push back my changes to the pending and use that as the
baseline for v4.

4 patches set to Changes Requested.

13218645 [v3,1/4] wifi: ath11k: remove unused function ath11k_tm_event_wmi
13218646 [v3,2/4] wifi: ath11k: optimize ath11k_tm_cmd_get_version
13218648 [v3,3/4] wifi: ath11k: factory test mode support
13218647 [v3,4/4] wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230420120840.18712-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
