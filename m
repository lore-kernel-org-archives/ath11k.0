Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZewC-0004PS-Pf
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:52:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k with QCA6391
References: <c9fb5fa6-297e-a595-7670-c9105641bc83@doubly.so>
Date: Mon, 02 Nov 2020 20:51:55 +0200
In-Reply-To: <c9fb5fa6-297e-a595-7670-c9105641bc83@doubly.so> (Devin Bayer's
 message of "Thu, 22 Oct 2020 17:14:54 +0200")
Message-ID: <87wnz3twvo.fsf@codeaurora.org>
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
To: Devin Bayer <dev@doubly.so>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Devin Bayer <dev@doubly.so> writes:

> I have recently purchased some QCA6391 cards and I am going to try to
> get them working with Linux.
>
> I've seen the instructions for QCA6390 and I'm wondering if they will
> also apply to QCA6391, or if it's possible to get it working without
> major work.

To my knowledge, from ath11k point of view, QCA6391 should look the same
as QCA6390 but most likely the board file for QCA6391 is different.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
