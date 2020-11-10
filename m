Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYAv-0000xB-8e
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 18:15:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: Handle errors if peer creation fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201004100218.311653-1-alex.dewar90@gmail.com>
References: <20201004100218.311653-1-alex.dewar90@gmail.com>
Message-Id: <20201110181500.00772C433C8@smtp.codeaurora.org>
Date: Tue, 10 Nov 2020 18:14:59 +0000 (UTC)
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
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org

Alex Dewar <alex.dewar90@gmail.com> wrote:

> ath11k_peer_create() is called without its return value being checked,
> meaning errors will be unhandled. Add missing check and, as the mutex is
> unconditionally unlocked on leaving this function, simplify the exit
> path.
> 
> Addresses-Coverity-ID: 1497531 ("Code maintainability issues")
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c134d1f8c436 ath11k: Handle errors if peer creation fails

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201004100218.311653-1-alex.dewar90@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
