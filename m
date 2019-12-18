Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdi8-0007ga-GH
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 18:06:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V2 1/2] ath11k: fix pdev when invoking
 ath11k_wmi_send_twt_enable_cmd()
References: <20191213153457.11946-1-john@phrozen.org>
Date: Wed, 18 Dec 2019 20:06:04 +0200
In-Reply-To: <20191213153457.11946-1-john@phrozen.org> (John Crispin's message
 of "Fri, 13 Dec 2019 16:34:56 +0100")
Message-ID: <87h81x8q5v.fsf@kamboji.qca.qualcomm.com>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
>
> The code currently uses the wrong pdev id when enabling TWT. Fix this by
> using the correct ones.
>
> Fixes: e65a616f4e74 ("ath11k: add TWT support")
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

I noticed only after I applied this, but the s-o-b line is in wrong
order. Pradeep, being the author, should have his s-o-b line first.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
