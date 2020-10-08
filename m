Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQTRg-0005EC-AU
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 10:46:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Fix memory leak on error path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201004100218.311653-2-alex.dewar90@gmail.com>
References: <20201004100218.311653-2-alex.dewar90@gmail.com>
Message-Id: <20201008104614.547CEC433CA@smtp.codeaurora.org>
Date: Thu,  8 Oct 2020 10:46:14 +0000 (UTC)
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
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org

Alex Dewar <alex.dewar90@gmail.com> wrote:

> In ath11k_mac_setup_iface_combinations(), if memory cannot be assigned
> for the variable limits, then the memory assigned to combinations will
> be leaked. Fix this.
> 
> Addresses-Coverity-ID: 1497534 ("Resource leaks")
> Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

8431350eee2e ath11k: Fix memory leak on error path

-- 
https://patchwork.kernel.org/patch/11815579/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
