Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8RzL-00019w-Kp
 for ath11k@lists.infradead.org; Wed, 19 Aug 2020 17:35:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 1/2] ath11k: switch to using ieee80211_tx_status_ext()
References: <20200803145444.473810-1-john@phrozen.org>
Date: Wed, 19 Aug 2020 20:34:28 +0300
In-Reply-To: <20200803145444.473810-1-john@phrozen.org> (John Crispin's
 message of "Mon, 3 Aug 2020 16:54:43 +0200")
Message-ID: <87d03milp7.fsf@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> This allows us to pass HE rates down into the stack.
>
> Signed-off-by: John Crispin <john@phrozen.org>

On what hardware and firmware was this tested?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
