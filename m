Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Ufo-0004uB-0v
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 12:29:56 +0000
Received: by mail-lj1-f197.google.com with SMTP id b15so3692483ljp.7
 for <ath11k@lists.infradead.org>; Tue, 11 Feb 2020 04:29:47 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 1/2] mac80211: allow setting queue_len for drivers not
 using wake_tx_queue
In-Reply-To: <20200211122605.13002-1-john@phrozen.org>
References: <20200211122605.13002-1-john@phrozen.org>
Date: Tue, 11 Feb 2020 13:29:44 +0100
Message-ID: <87eev1b93b.fsf@toke.dk>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> Currently a mac80211 driver can only set the txq_limit when using
> wake_tx_queue. Not all drivers use wake_tx_queue. This patch adds a new
> element to wiphy allowing a driver to set a custom tx_queue_len and the
> code that will apply it in case it is set. The current default is
> 1000 which is too low for ath11k when doing HE rates.

Fine, but we should really fix ath11k to do something smarter than a
fixed queue len... 4096 packets is 6 seconds of queueing at 8Mbps :/

-Toke


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
